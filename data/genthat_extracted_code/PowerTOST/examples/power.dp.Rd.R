library(PowerTOST)


### Name: power.dp
### Title: Power of dose-proportionality studies evaluated via Power model
### Aliases: power.dp

### ** Examples

# using all the defaults, i.e. latin square crossover design, alpha=0.05, 
# beta0=1+log(0.95)/log(rd), theta1=0.8, theta2=1.25
power.dp(CV=0.2, doses=c(1,2,8), n=15)
#
# period balanced IBD with 3 doses, 2 periods and 3 sequences,
ibd <- matrix(c(1,2,3,2,3,1), nrow=3, ncol=2)
power.dp(CV=0.2, doses=c(1,2,8), n=12, design="IBD", dm=ibd)
# considerably lower than 3x3 Latin square



