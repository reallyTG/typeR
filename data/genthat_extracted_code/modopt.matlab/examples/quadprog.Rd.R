library(modopt.matlab)


### Name: quadprog
### Title: MatLab(R)-style Quadratic Programming in R using ROI
### Aliases: quadprog

### ** Examples

# Covariance matrix of four stocks (weekly returns from 2011):
#
#              AAPL          IBM         MSFT         ORCL
# AAPL 0.0014708114 0.0006940036 0.0006720841 0.0008276391
# IBM  0.0006940036 0.0009643581 0.0006239411 0.0011266429
# MSFT 0.0006720841 0.0006239411 0.0009387707 0.0008728736
# ORCL 0.0008276391 0.0011266429 0.0008728736 0.0021489512

covariance = matrix(c(0.0014708114, 0.0006940036, 0.0006720841, 0.0008276391, 
                      0.0006940036, 0.0009643581, 0.0006239411, 0.0011266429, 
                      0.0006720841, 0.0006239411, 0.0009387707, 0.0008728736, 
                      0.0008276391, 0.0011266429, 0.0008728736, 0.0021489512), 
                      nrow=4, byrow=TRUE)
assets <- dim(covariance)[1]

H <- covariance
f <- rep(0, assets)
Aeq <- rep(1, assets)
beq <- 1
lb <- rep(0, assets)
ub <- rep(1, assets)

solution <- quadprog(H, f, NULL, NULL, Aeq, beq, lb, ub)
portfolio <- solution$x
print(portfolio)




