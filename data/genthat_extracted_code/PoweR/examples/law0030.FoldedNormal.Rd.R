library(PoweR)


### Name: law0030.FoldedNormal
### Title: The Folded Normal Distribution
### Aliases: law0030.FoldedNormal law0030
### Keywords: law, Normal, Folded Normal

### ** Examples
res <- gensample(30,10000,law.pars=c(8,6))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



