library(mixtools)


### Name: summary.mixEM
### Title: Summarizing EM mixture model fits
### Aliases: summary.mixEM
### Keywords: file

### ** Examples

data(faithful)
attach(faithful)
set.seed(100)
out <- normalmixEM(waiting, mu=c(50,80), sigma=c(5,5), lambda=c(.5,.5))
summary(out)



