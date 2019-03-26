library(OCA)


### Name: Overbeck2
### Title: Overbeck type II Allocation Principle
### Aliases: Overbeck2
### Keywords: manip

### ** Examples

data(dat1, dat2)
Loss <- cbind(Loss1=dat1[1:400, ], Loss2=unname(dat2))
# Proportions of capital to be allocated to each bussines unit
Overbeck2(Loss, Capital=1) 

# Capital allocation,
# capital is determined as the empirical VaR of the losses at 99%  
K <- quantile(rowSums(Loss),  probs = 0.99)
Overbeck2(Loss, Capital=K)



