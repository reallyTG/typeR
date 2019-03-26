library(kergp)


### Name: q1Diag
### Title: Qualitative Correlation or Covariance Kernel with one Input and
###   Diagonal Structure
### Aliases: q1Diag

### ** Examples

School <- factor(1L:3L, labels = c("Bad", "Mean" , "Good"))

## correlation: no parameter!
myCor <- q1Diag(School, input = "School")

## covariance 
myCov <- q1Diag(School, input = "School", cov = "hete")
coef(myCov) <- c(1.1, 2.2, 3.3)




