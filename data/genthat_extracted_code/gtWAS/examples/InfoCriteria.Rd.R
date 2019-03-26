library(gtWAS)


### Name: InfoCriteria
### Title: Compute information cirteria statistics
### Aliases: InfoCriteria
### Keywords: Model Selection

### ** Examples

set.seed(4)
YX <- matrix(rnorm(200,20,4),20,10)
YX <- as.data.frame(YX)
colnames(YX) <- c("Y1","Y2",paste("X",c(1:8),sep=""))
lm_formula <- as.formula("Y1~X1+X2+X3+X4+X5")
lmresult <- lm(lm_formula,data=YX)
InfoCriteria("SBC", lmresult, nrow(YX), 0)



