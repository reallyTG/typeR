library(MVT)


### Name: center.test
### Title: One-sample location test
### Aliases: center.test
### Keywords: htest

### ** Examples

data(cork)
x <- sweep(cork[,2:4], 1, cork[,1], "-")
colnames(x) <- c("E_N", "S_N", "W_N")
pairs(x)

fit <- studentFit(x, family = Student(eta = .25))
z <- center.test(fit, center = c(0,0,0), test = "score")
z



