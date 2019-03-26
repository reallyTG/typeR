library(RHawkes)


### Name: mllRH1
### Title: Minus loglikelihood of a RHawkes model with parent probabilities
### Aliases: mllRH1
### Keywords: parent probabilities likelihood

### ** Examples

tmp <- mllRH1(sort(runif(10,0,100)), 100, c(2,1,0.5,1))
for(i in 1:tmp$n)
  cat(exp(tmp$log.p[i*(i - 1)/2 + 1:i]), "\n")    



