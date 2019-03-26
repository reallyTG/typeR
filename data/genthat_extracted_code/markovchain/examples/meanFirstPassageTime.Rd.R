library(markovchain)


### Name: meanFirstPassageTime
### Title: Mean First Passage Time for markovchain
### Aliases: meanFirstPassageTime

### ** Examples

Pmat <- matrix( c(6,3,1,  2,3,5, 4,1,5)/10, ncol=3, byrow=TRUE)
P <- new("markovchain", states=c("s","c","r"), transitionMatrix=Pmat)
meanFirstPassageTime(P,"r")
meanFirstPassageTime(P)

# Grinstead and Snell's "Oz weather" worked out example
Poz <- new("markovchain", states=c("s","c","r"), 
           transitionMatrix=matrix(c(2,1,1, 2,0,2, 1,1,2)/4, byrow=TRUE, ncol=3)) 
meanFirstPassageTime(Poz)  



