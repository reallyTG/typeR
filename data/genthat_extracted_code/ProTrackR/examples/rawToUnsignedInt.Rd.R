library(ProTrackR)


### Name: rawToUnsignedInt
### Title: Convert raw vector into a single unsigned integer value
### Aliases: rawToUnsignedInt

### ** Examples

## generate some raw data:
some.raw.data <- as.raw(c(0x01, 0x1e, 0x3f))

## convert raw data into an unsigned integer:
rawToUnsignedInt(some.raw.data)

## note the difference with
as.integer(some.raw.data)




