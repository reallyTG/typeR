library(robustbase)


### Name: Qn
### Title: Robust Location-Free Scale Estimate More Efficient than MAD
### Aliases: Qn Qn.old s_Qn
### Keywords: robust univar

### ** Examples

set.seed(153)
x <- sort(c(rnorm(80), rt(20, df = 1)))
s_Qn(x, mu.too = TRUE)
Qn(x, finite.corr = FALSE)



