library(PoweR)


### Name: law0020.JohnsonSB
### Title: The Johnson SB Distribution
### Aliases: law0020.JohnsonSB law0020
### Keywords: law, Johnson SB

### ** Examples
res <- gensample(20,10000,law.pars=c(8,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



