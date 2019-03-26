library(grpSLOPE)


### Name: lambdaGroupSLOPE
### Title: Regularizing sequence for Group SLOPE
### Aliases: lambdaGroupSLOPE

### ** Examples

# specify 6 groups of sizes 2, 3, and 4
group <- c(1, 1, 2, 2, 2, 3, 3, 3, 3,
           4, 4, 5, 5, 5, 6, 6, 6, 6)
# set the weight for each group to the square root of the group's size
wt <- rep(c(sqrt(2), sqrt(3), sqrt(4)), 2)
names(wt) <- 1:6
# compute different lambda sequences
lambda.max <- lambdaGroupSLOPE(method="max", fdr=0.1, group=group, wt=wt) 
lambda.mean <- lambdaGroupSLOPE(method="mean", fdr=0.1, group=group, wt=wt) 
lambda.corrected <- lambdaGroupSLOPE(method="corrected", fdr=0.1,
                                     group=group, wt=wt, n.obs=1000)
rbind(lambda.max, lambda.mean, lambda.corrected)
#                      [,1]     [,2]     [,3]     [,4]     [,5]     [,6]
# lambda.max       2.023449 1.844234 1.730818 1.645615 1.576359 1.517427
# lambda.mean      1.880540 1.723559 1.626517 1.554561 1.496603 1.447609
# lambda.corrected 1.880540 1.729811 1.637290 1.568971 1.514028 1.467551




