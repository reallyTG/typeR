library(PoweR)


### Name: law0014.AverageUnif
### Title: The Average Uniform Distribution
### Aliases: law0014.AverageUnif law0014
### Keywords: law, Average Uniform

### ** Examples
res <- gensample(14,10000,law.pars=c(9,2,3))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



