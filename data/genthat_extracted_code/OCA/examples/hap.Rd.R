library(OCA)


### Name: hap
### Title: Haircut Allocation Principle
### Aliases: hap
### Keywords: manip

### ** Examples


data(dat1, dat2)
Loss <- cbind(Loss1=dat1[1:400, ], Loss2=unname(dat2))
# Proportions of capital to be allocated to each bussines unit
hap(Loss, Capital=1) 

# Capital allocation,
# capital is determined as the empirical VaR of the losses at 99%  
K <- quantile(rowSums(Loss),  probs = 0.99)
hap(Loss, Capital=K)





