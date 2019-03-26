library(PoweR)


### Name: law0004.Logistic
### Title: The Logistic Distribution
### Aliases: law0004.Logistic law0004
### Keywords: law, Logistic

### ** Examples
res <- gensample(4,10000,law.pars=c(9,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



