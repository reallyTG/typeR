library(adfExplorer)


### Name: amigaIntToRaw
### Title: Convert Amiga integers into raw values
### Aliases: amigaIntToRaw

### ** Examples

## some unsigned 8-bit integers:
ubyte <- sample.int(255, 100, TRUE)

## The same values as raw data:
amigaIntToRaw(ubyte)

## some signed 8-bit integers:
byte <- sample.int(255, 100, TRUE) - 128

## The same values as raw data:
amigaIntToRaw(byte, signed = TRUE)

## some signed 16-bit integers:
word <- sample.int(2^16, 100, TRUE) - 2^15

## The same values as raw data:
amigaIntToRaw(word, 16, TRUE)

## note that 16-bit integers require
## twice as many raw values:
length(amigaIntToRaw(word, 16, TRUE))
length(amigaIntToRaw(byte, 8, TRUE))



