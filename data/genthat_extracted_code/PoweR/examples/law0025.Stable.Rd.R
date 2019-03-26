library(PoweR)


### Name: law0025.Stable
### Title: The Stable Distribution
### Aliases: law0025.Stable law0025
### Keywords: law, Stable

### ** Examples
res <- gensample(25,10000,law.pars=c(2,1,1,2))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



