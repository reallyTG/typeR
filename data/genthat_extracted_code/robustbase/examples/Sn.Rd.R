library(robustbase)


### Name: Sn
### Title: Robust Location-Free Scale Estimate More Efficient than MAD
### Aliases: Sn s_Sn
### Keywords: robust univar

### ** Examples

x <- c(1:10, 100+1:9)# 9 outliers out of 19
Sn(x)
Sn(x, c=1)# 9
Sn(x[1:18], c=1)# 9
set.seed(153)
x <- sort(c(rnorm(80), rt(20, df = 1)))
s_Sn(x, mu.too=TRUE)



