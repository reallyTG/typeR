library(ibelief)


### Name: discounting
### Title: Discounting masses
### Aliases: discounting

### ** Examples

## The conflict table for two experts in a discernment frame with three elements
m1=c(0,0.4, 0.1, 0.2, 0.2, 0, 0, 0.1);
m2=c(0,0.2, 0.3, 0.1, 0.1, 0, 0.2, 0.1);
discounting(m1,0.95)
# if only one factor is given, all the masses are discounted using the same factor
discounting(cbind(m1,m2),0.95)
# if the factor vector is given, the masses are discounted using the corresponding factor
discounting(cbind(m1,m2),c(0.95,0.9))



