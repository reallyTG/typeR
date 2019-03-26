library(Rwave)


### Name: crc
### Title: Ridge Extraction by Crazy Climbers
### Aliases: crc
### Keywords: ts

### ** Examples

   data(HOWAREYOU)
 plot.ts(HOWAREYOU)
 
cgtHOWAREYOU <- cgt(HOWAREYOU,70,0.01,100)

clHOWAREYOU <- crc(Mod(cgtHOWAREYOU),nbclimb=1000)




