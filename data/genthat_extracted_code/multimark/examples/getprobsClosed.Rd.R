library(multimark)


### Name: getprobsClosed
### Title: Calculate posterior capture and recapture probabilities
### Aliases: getprobsClosed

### ** Examples

## Don't show: 
test<-getprobsClosed(multimarkClosed(Enc.Mat=bobcat,data.type="never",iter=10,burnin=0,bin=5))
## End(Don't show)
## No test: 
# This example is excluded from testing to reduce package check time
# Example uses unrealistically low values for nchain, iter, and burnin

#Run behavior model for bobcat data with constant detection probability (i.e., mod.p=~c)
bobcat.c <- multimarkClosed(bobcat,mod.p=~c)
  
#Calculate capture and recapture probabilities
pc <- getprobsClosed(bobcat.c)
summary(pc)
## End(No test)



