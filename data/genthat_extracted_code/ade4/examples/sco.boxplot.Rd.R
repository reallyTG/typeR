library(ade4)


### Name: sco.boxplot
### Title: Representation of the link between a variable and a set of
###   qualitative variables
### Aliases: sco.boxplot
### Keywords: multivariate hplot

### ** Examples

w1 <- rnorm(100,-1)
w2 <- rnorm(100)
w3 <- rnorm(100,1)
f1 <- gl(3,100)
f2 <- gl(30,10)
sco.boxplot(c(w1,w2,w3), data.frame(f1,f2))

data(banque)
banque.acm <- dudi.acm(banque, scan = FALSE, nf = 4)
par(mfrow = c(1,3))
sco.boxplot(banque.acm$l1[,1], banque[,1:7], clab = 1.8)
sco.boxplot(banque.acm$l1[,1], banque[,8:14], clab = 1.8)
sco.boxplot(banque.acm$l1[,1], banque[,15:21], clab = 1.8)
par(mfrow = c(1,1))



