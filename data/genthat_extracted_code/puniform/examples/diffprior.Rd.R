library(puniform)


### Name: diffprior
### Title: diffprior
### Aliases: diffprior

### ** Examples

### Example as presented on page 491 in Maxwell, Lau, and Howard (2015)
res.snap <- snapshot(ri=c(0.243, 0.114), ni=c(80, 172), alpha=.05)

### Prior probabilities with probablity for no effect twice as large as for the other true effects
prior <- c(0.4, 0.2, 0.2, 0.2)

### Compute posterior probabilities based on new prior
diffprior(prior = prior, res.snap = res.snap)




