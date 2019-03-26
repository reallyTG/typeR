library(Rwave)


### Name: cfamily
### Title: Ridge Chaining Procedure
### Aliases: cfamily
### Keywords: ts

### ** Examples


## Not run: 
##D    data(HOWAREYOU)
##D  plot.ts(HOWAREYOU)
##D  
##D cgtHOWAREYOU <- cgt(HOWAREYOU,70,0.01,100)
##D 
##D clHOWAREYOU <- crc(Mod(cgtHOWAREYOU),nbclimb=1000)
##D 
##D cfHOWAREYOU <- cfamily(clHOWAREYOU,ptile=0.001)
##D image(cfHOWAREYOU$ordered > 0)
## End(Not run)



