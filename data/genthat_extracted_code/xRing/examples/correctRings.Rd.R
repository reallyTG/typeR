library(xRing)


### Name: correctRings
### Title: Correct Tree-Ring Borders Interactively
### Aliases: correctRings

### ** Examples

if(interactive()){
 data(PaPiRaw)
 data(PaPiSpan)
 PaPi <- detectRings(PaPiRaw, PaPiSpan)
 PaPiCorrect <- correctRings(PaPi)
}




