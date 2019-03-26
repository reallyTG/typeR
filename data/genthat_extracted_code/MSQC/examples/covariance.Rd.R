library(MSQC)


### Name: covariance
### Title: Sample covariance
### Aliases: covariance
### Keywords: ~kwd1 ~kwd2

### ** Examples

# individual case 
data(bimetal1)
covariance(bimetal1, method = "sw")
covariance(bimetal1, method = "hm")

# rational subgroup case
data(carbon1)
covariance(carbon1)



