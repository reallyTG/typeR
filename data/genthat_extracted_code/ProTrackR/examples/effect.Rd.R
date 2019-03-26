library(ProTrackR)


### Name: effect
### Title: Extract or replace effect/trigger codes
### Aliases: effect effect,PTCell-method effect<-
###   effect<-,PTCell,character-method

### ** Examples

data("mod.intro")

## the PTCell in row #1, of pattern #1, track #1
## has effect code "A08", which is a volume slide down (0xA)
## with speed 0x8:
effect(PTCell(mod.intro, 1, 1, 1))

## this is how you can change an effect:
cell <- PTCell("C-2 01 000")
effect(cell) <- "C20"

## the above expression sets the volume (effect 0xC)
## to 50% (0x20 which is halve of the maximum 0x40)



