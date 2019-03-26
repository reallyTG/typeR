library(agridat)


### Name: dasilva.maize
### Title: Multi-environment trial of maize
### Aliases: dasilva.maize
### Keywords: datasets

### ** Examples

data(dasilva.maize)
dat = dasilva.maize

# Try to match Table 1 of da Silva 2015.
# aggregate(yield ~ env, data=dat, FUN=mean)
##   env     yield
## 1  E1  6.211817  # match E2 in Table 1
## 2  E2  4.549104  # E3
## 3  E3  5.152254  # E4
## 4  E4  6.245904  # E5
## 5  E5  8.084609  # E6
## 6  E6 13.191890  # E7
## 7  E7  8.895721  # E8
## 8  E8  8.685448  
## 9  E9  8.737089  # E9

# Unable to match CVs in Table 2, but who knows what they used
# for residual variance.
# aggregate(yield ~ env, data=dat, FUN=function(x) 100*sd(x)/mean(x))




