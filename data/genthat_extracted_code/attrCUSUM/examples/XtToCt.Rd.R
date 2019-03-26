library(attrCUSUM)


### Name: XtToCt
### Title: Convert from Data to FSI CUSUM Statistic
### Aliases: XtToCt

### ** Examples

# Example 1: Poisson distribution
Ct <- XtToCt(Xt = rpois(200L, 4), refv = 5, c.zero = 0)
plot(Ct, type = "o", pch = 16, main = "CUSUM statistic",
     ylab = expression(C[t]),
     sub = expression(paste(C[t],"=", "max(",C[t - 1],",",0,")",
                            "+ refv -",X[t])))



