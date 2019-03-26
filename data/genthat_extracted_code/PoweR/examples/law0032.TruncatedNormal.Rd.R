library(PoweR)


### Name: law0032.TruncatedNormal
### Title: The Truncated Normal Distribution
### Aliases: law0032.TruncatedNormal law0032
### Keywords: law, Normal, Truncated Normal

### ** Examples
res <- gensample(32,10000,law.pars=c(2,3))
res$law
res$law.pars
mean(res$sample)
sd(res$sample)



