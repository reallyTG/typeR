library(adfExplorer)


### Name: rawToBitmap
### Title: Convert raw data into a bitmap or vice versa
### Aliases: rawToBitmap bitmapToRaw

### ** Examples

## The bitmap block of the example disk is located at block
## number 882 (note that this is not true for all disks,
## the actual location is stored in the root block)
data(adf.example)
bitmap.block <- amigaBlock(adf.example, 881)

## bitmap data are stored in bytes 5 up to 224 in this block:
bitmap.raw <- bitmap.block@data[5:224]

## let's get the bitmap from the raw data:
bitmap <- rawToBitmap(bitmap.raw)

## Whe can now get the occupied blocks (minus one is used for
## the discrepancy in indexing):
which(bitmap != as.raw(0x01)) - 1

## we can also do the reverse:
bitmap.raw.new <-  bitmapToRaw(bitmap)
## it should be the same as the original raw data:
all(bitmap.raw.new == bitmap.raw)

## WARNING: don't use these methods to directly
## modify an amigaDisk objects bitmap block. The
## file system on that object may get corrupted.
## All methods in this package should update the
## bitmap block automatically and cleanly...



