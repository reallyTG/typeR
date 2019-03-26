library(RI2by2)


### Name: Robins.CI
### Title: Asymptotic confidence interval for a treatment effect on a
###   binary outcome
### Aliases: Robins.CI
### Keywords: randomization inference

### ** Examples

#Example 1 from Robins (1988)
ex = matrix(c(40,60,15,85),2,2,byrow=TRUE)
Robins.CI(ex,0.05)



