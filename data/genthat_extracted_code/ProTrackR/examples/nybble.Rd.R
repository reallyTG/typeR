library(ProTrackR)


### Name: nybble
### Title: Get the high or low nybble of a raw value
### Aliases: nybble loNybble hiNybble

### ** Examples

## this will return 0x0f:
hiNybble(as.raw(0xf3))

## which is the same as:
nybble(as.raw(0xf3), "high")

## this will return 0x03:
loNybble(as.raw(0xf3))

## which is the same as:
nybble(as.raw(0xf3), "low")



