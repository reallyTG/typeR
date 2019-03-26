library(PoweR)


### Name: gensample
### Title: Generate random samples from a law added in the package.
### Aliases: gensample rlaw
### Keywords: distribution datagen

### ** Examples

# This is good to check if the generator of the given law has been well coded.

res <- gensample(2,10000,law.pars=c(-5,2),check=TRUE)
res$law
res$law.pars
mean(res$sample)
sd(res$sample)

# See function checklaw() in this package.
hist(gensample(2,10000,law.pars=c(0,1),check=TRUE)$sample,prob=TRUE,breaks=100,main="Density
histogram of the N(0,1) distribution")
curve(dnorm(x),add=TRUE,col="blue")




