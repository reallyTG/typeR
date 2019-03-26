library(bandit)


### Name: significance_analysis
### Title: significance_analysis
### Aliases: significance_analysis
### Keywords: htest design

### ** Examples

x = c(10,20,30,50)
n = c(100,102,120,130)
sa = significance_analysis(x,n)
sa[rev(order(sa$estimated_proportion)), ]

x = c(37,41,30,43,39,30,31,35,50,30)
n = rep(50, length(x))
sa = significance_analysis(x,n)
sa[rev(order(sa$estimated_proportion)), ]

x = c(37,41,30,43,39,30,31,37,50,30)
n = rep(50, length(x))
sa = significance_analysis(x,n)
sa[rev(order(sa$estimated_proportion)), ]



