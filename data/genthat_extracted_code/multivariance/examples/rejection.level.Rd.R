library(multivariance)


### Name: rejection.level
### Title: rejection level for the test statistic
### Aliases: rejection.level

### ** Examples

rejection.level(0.05) #the rejection level, for comparison with the following values
total.multivariance(matrix(rnorm(100*3),ncol = 3)) #independent sample
total.multivariance(coins(100)) #dependent sample which is 2-independent

# and the p values are (to compare with alpha)
multivariance.pvalue(total.multivariance(matrix(rnorm(100*3),ncol = 3))) #independent sample
multivariance.pvalue(total.multivariance(coins(100))) #dependent sample which is 2-independent

## Not run: 
##D # visualization of the rejection level
##D curve(rejection.level(x),xlim = c(0.001,0.215),xlab = "alpha")
## End(Not run)




