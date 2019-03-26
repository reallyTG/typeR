library(PoweR)


### Name: law0028.GeneralizedExtValue
### Title: The Generalized Extreme Value Distribution
### Aliases: law0028.GeneralizedExtValue law0028
### Keywords: law, Generalized Extreme Value

### ** Examples
res <- gensample(28,10000,law.pars=c(8,6,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



