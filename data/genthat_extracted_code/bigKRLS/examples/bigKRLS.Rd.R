library(bigKRLS)


### Name: bigKRLS
### Title: bigKRLS
### Aliases: bigKRLS bigKRLS-package bigKRLS-package bigKRLS

### ** Examples

# weight of chickens toy dataset
# y <- as.matrix(ChickWeight$weight) 
# X <- matrix(cbind(ChickWeight$Time, ChickWeight$Diet == 1), ncol = 2)
# out <- bigKRLS(y, X)
# out$R2                                     # 0.7635361
# summary(out, labs = c("Time", "Diet")) 
# save.bigKRLS(out, "exciting_results") 
# don't use save() unless out$has.big.matrices == FALSE
# out2 <- bigKRLS(y, X, which.derivatives = 2) 
# if x2 is variable of interest 



