library(cat)


### Name: ipf
### Title: Iterative Proportional Fitting
### Aliases: ipf
### Keywords: models

### ** Examples

data(HairEyeColor)                     # load data
m=c(1,2,0,1,3,0,2,3)                   # no three-way interaction
fit1 <- ipf(HairEyeColor,margins=m,
            showits=TRUE)              # fit model
X2 <- sum((HairEyeColor-fit1)^2/fit1)  # Pearson chi square statistic
df <- prod(dim(HairEyeColor)-1)        # Degrees of freedom for this example
1 - pchisq(X2,df)                      # p-value for fit1



