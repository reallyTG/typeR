library(poLCA)


### Name: rmulti
### Title: Random draws from a multinomial distribution
### Aliases: rmulti
### Keywords: methods

### ** Examples

##
## One draw from a three-category multinomial distribution.
##
p1 <- c(0.7,0.2,0.1)
rmulti(p1)

##
## 10,000 draws from a three-category multinomial distribution.
##
n <- 10000
p2 <- matrix(p1,nrow=n,ncol=length(p1),byrow=TRUE)
rmdraws <- rmulti(p2)
table(rmdraws)/n    # should be approximately 0.7, 0.2, 0.1

##
## 10,000 draws from a mixture of three groups of a
## four-category multinomial distribution.
##
group.p <- matrix(c(0.5,0.3,0.2),nrow=n,ncol=3,byrow=TRUE)
group <- rmulti(group.p)
p3 <- t(matrix(NA,nrow=n,ncol=4))
p3[,group==1] <- c(0.7,0.1,0.1,0.1)
p3[,group==2] <- c(0.1,0.7,0.1,0.1)
p3[,group==3] <- c(0.1,0.1,0.1,0.7)
p3 <- t(p3)
rmdraws3 <- rmulti(p3)
table(group,rmdraws3)
table(group,rmdraws3)/rowSums(table(group,rmdraws3))



