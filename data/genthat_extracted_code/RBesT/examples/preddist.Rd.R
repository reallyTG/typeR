library(RBesT)


### Name: preddist
### Title: Predictive Distributions for Mixture Distributions
### Aliases: preddist preddist.betaMix preddist.normMix preddist.gammaMix

### ** Examples


# Example 1: predictive distribution from uniform prior.
bm <- mixbeta(c(1,1,1))
bmPred <- preddist(bm, n=10)
# predictive proabilities and cumulative predictive probabilities
x <- 0:10
d <- dmix(bmPred, x)
names(d) <- x
barplot(d)
cd <- pmix(bmPred, x)
names(cd) <- x
barplot(cd)
# median
mdn <- qmix(bmPred,0.5)
mdn

# Example 2: 2-comp Beta mixture

bm <- mixbeta( inf=c(0.8,15,50),rob=c(0.2,1,1))
plot(bm)
bmPred <- preddist(bm,n=10)
plot(bmPred)
mdn <- qmix(bmPred,0.5)
mdn
d <- dmix(bmPred,x=0:10)
## Not run: 
##D n.sim <- 100000
##D r <-  rmix(bmPred,n.sim)
##D d
##D table(r)/n.sim
## End(Not run)

# Example 3: 3-comp Normal mixture

m3 <- mixnorm( c(0.50,-0.2,0.1),c(0.25,0,0.2), c(0.25,0,0.5), sigma=10)
print(m3)
summary(m3)
plot(m3)
predm3 <- preddist(m3,n=2)
plot(predm3)
print(predm3)
summary(predm3)




