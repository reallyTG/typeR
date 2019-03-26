library(optR)


### Name: optR.formula
### Title: Optimization & predictive modelling Toolsets
### Aliases: optR.formula

### ** Examples

# Solving equation Ax=b
b<-matrix(c(-14,36, 6), nrow=3,ncol=1,byrow=TRUE)
A<-matrix(c(6,-4,1, -4,6,-4,1,-4,6), nrow=3,ncol=3, byrow = TRUE)
Z<-optR(b~A-1, method="gauss") # -1 to remove the constant vector

Z<-optR(b~A-1, method="LU") # -1 to remove the constant vector

require(utils)
set.seed(129)
n <- 10 ; p <- 4
X <- matrix(rnorm(n * p), n, p) # no intercept!
y <- rnorm(n)
data<-cbind(X, y)
colnames(data)<-c("var1", "var2", "var3", "var4", "y")
Z<-optR(y~var1+var2+var3+var4+var1*var2-1, data=data.frame(data), method="cgm")




