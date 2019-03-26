library(rms.gof)


### Name: rms.pval
### Title: P-value for root-mean-square goodness-of-fit test for simple
###   null hypothesis
### Aliases: rms.pval

### ** Examples

#This example is from section 5.1.2 of the referenced text

k <- c(1:128)
#Define model distribution (exp) and observed distribution (obs)
C1 <- 1/sum(1/k)
exp <- C1/k

C2 <- 1/sum(1/k^2)
obs <- C2/k^2

rms.pval(obs,exp,10000)




