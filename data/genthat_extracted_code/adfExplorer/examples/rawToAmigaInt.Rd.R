library(adfExplorer)


### Name: rawToAmigaInt
### Title: Convert raw values into Amiga integers
### Aliases: rawToAmigaInt

### ** Examples

## Let's start by obtaining unsigned 8-bit integers:
rawToAmigaInt(as.raw(0:255))

## note that this is the same as:
as.numeric(as.raw(0:255))

## but with this function we can also get signed values:
rawToAmigaInt(as.raw(0:255), signed = TRUE)

## Furthermore 32 or 16-bit integers can also be obtained.
## Let's look at 16-bit integers:
rawToAmigaInt(as.raw(0:255), 16)

## Note that 16-bit integers require twice as many bytes
## as 8 bit integers:
length(rawToAmigaInt(as.raw(0:255), 16))
length(rawToAmigaInt(as.raw(0:255), 8))



