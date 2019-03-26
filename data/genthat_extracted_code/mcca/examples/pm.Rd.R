library(mcca)


### Name: pm
### Title: Calculate Probability Matrix
### Aliases: pm
### Keywords: PM

### ** Examples

rm(list=ls())
str(iris)
data <- iris[, 1:4]
label <- iris[, 5]
pm(y = label, d = data,method = "multinom", k = 3)




