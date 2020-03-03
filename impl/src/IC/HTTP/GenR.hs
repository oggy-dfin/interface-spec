{-|
This module describe a type for our “generic request (or response)” format. It
can be seen as a simplified (and more abstract) AST for CBOR data.

The following operations can be done on generic requests
 * Parsing from CBOR
 * Encoding to CBOR
 * Request ID calculation
 * Thus: Signing and signature checking
-}
module IC.HTTP.GenR where

import Numeric.Natural
import Data.Text
import Data.ByteString
import Data.HashMap.Lazy

data GenR
    = GNat Natural
    | GText Text
    | GBlob ByteString
    | GRec (HashMap Text GenR)
  deriving Show

emptyR :: GenR
emptyR = GRec Data.HashMap.Lazy.empty