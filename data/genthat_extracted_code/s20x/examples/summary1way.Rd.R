library(s20x)


### Name: summary1way
### Title: One-way Analysis of Variance Summary
### Aliases: summary1way
### Keywords: models

### ** Examples


attitudes = c(5.2,5.2,6.1,6,5.75,5.6,6.25,6.8,6.87,7.1,
               6.3,6.35,5.5,5.75,4.6,5.36,5.85,5.9)
l = rep(c('Gp1','Gp2','Gp3'),rep(6,3))
l = factor(l)
f = lm(attitudes ~ l)
result = summary1way(f)
result




