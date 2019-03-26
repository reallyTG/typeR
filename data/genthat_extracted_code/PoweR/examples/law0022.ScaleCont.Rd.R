library(PoweR)


### Name: law0022.ScaleCont
### Title: The Scale Contaminated Distribution
### Aliases: law0022.ScaleCont law0022
### Keywords: law, Scale Contaminated

### ** Examples
res <- gensample(22,10000,law.pars=c(0.8,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



