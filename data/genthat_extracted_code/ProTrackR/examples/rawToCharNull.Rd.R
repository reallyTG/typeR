library(ProTrackR)


### Name: rawToCharNull
### Title: Convert raw vectors into a character string
### Aliases: rawToCharNull

### ** Examples

## generate some raw data with an embedded 0x00:
some.raw.data <- as.raw(c(0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x00,
                          0x77, 0x6f, 0x72, 0x6c, 0x64, 0x21))
## Not run: 
##D ## this will fail:
##D try(rawToChar(some.raw.data))
## End(Not run)

## this will succeed:
rawToCharNull(some.raw.data)




