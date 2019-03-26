library(PoweR)


### Name: law0017.JohnsonSU
### Title: The Johnson SU Distribution
### Aliases: law0017.JohnsonSU law0017
### Keywords: law, Johnson SU

### ** Examples
res <- gensample(17,10000,law.pars=c(9,8,6,0.5))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



