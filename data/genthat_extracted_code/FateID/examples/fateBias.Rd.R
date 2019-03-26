library(FateID)


### Name: fateBias
### Title: Computation of fate bias
### Aliases: fateBias

### ** Examples

x <- intestine$x
y <- intestine$y
tar <- c(6,9,13)
fb <- fateBias(x,y,tar,minnr=5,minnrh=20,adapt=TRUE,confidence=0.75,nbfactor=5)
head(fb$probs)



