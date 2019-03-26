library(psych)


### Name: bassAckward
### Title: The Bass-Ackward factoring algorithm discussed by Goldberg
### Aliases: bassAckward bassAckward.diagram
### Keywords: multivariate models

### ** Examples

bassAckward(Thurstone,4,main="Thurstone data set")
print(bassAckward(bfi[1:25],c(2,3,5),main="bfi data set"),short=FALSE)
 #do pca instead of factors  just summarize, don't plot
summary(bassAckward(bfi[1:25],c(1,3,5,7),fm="pca",main="Components",plot=FALSE))
##not run, but useful example
#sp5 <- bassAckward(spi[11:145], c(3,4,5,27))



