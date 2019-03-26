library(PoweR)


### Name: law0033.Nout
### Title: The Normal with outliers Distribution
### Aliases: law0033.Nout law0033
### Keywords: law, Normal, Normal with outliers

### ** Examples
res <- gensample(33,10000,law.pars=4)
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



