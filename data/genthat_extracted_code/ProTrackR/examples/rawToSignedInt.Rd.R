library(ProTrackR)


### Name: rawToSignedInt
### Title: Convert a raw vector into signed integers (short)
### Aliases: rawToSignedInt

### ** Examples

## generate some raw data:
some.raw.data <- as.raw(c(0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x90))

## convert the raw data into a vector of signed intgers:
rawToSignedInt(some.raw.data)




