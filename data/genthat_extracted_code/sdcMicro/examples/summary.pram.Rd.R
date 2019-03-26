library(sdcMicro)


### Name: summary.pram
### Title: Summary method for objects from class pram
### Aliases: summary.pram
### Keywords: print

### ** Examples


data(free1)
x <- as.factor(free1[,"MARSTAT"])
x2 <- pram(x)
x2
summary(x2)




