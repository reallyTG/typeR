library(medmod)


### Name: mod
### Title: Moderation
### Aliases: mod

### ** Examples

set.seed(1234)
X <- rnorm(10)
M <- rnorm(10)
X_M <- X*M
Y <- 0.7*X + 0.1*M + 4.2*X_M + rnorm(10)
dat <- data.frame(X=X, M=M, Y=Y)   

mod(dat, dep = "Y", pred = "X", mod = "M")

#
#  Moderation Estimates                               
#  -------------------------------------------------- 
#             Estimate    SE        Z        p        
#  -------------------------------------------------- 
#    X           0.951    0.0965     9.86    < .001   
#    M          -0.471    0.0923    -5.10    < .001   
#    X:M         4.185    0.1009    41.50    < .001   
#  -------------------------------------------------- 
# 
# 




