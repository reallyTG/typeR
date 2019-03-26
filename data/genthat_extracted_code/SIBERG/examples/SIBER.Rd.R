library(SIBERG)


### Name: SIBER
### Title: Fit Mixture Model on The RNAseq Data and Calculates Bimodality
###   Index
### Aliases: SIBER

### ** Examples

# artificial RNAseq data from negative binomial distribution
set.seed(1000)
dat <- rnbinom(100, mu=1000, size=1/0.2)
# fit SIBER with the 4 mixture models
SIBER(y=dat, model='LN')
SIBER(y=dat, model='NB')
SIBER(y=dat, model='GP')
SIBER(y=log(dat+1), model='NL')




