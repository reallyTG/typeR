library(mclust)


### Name: summary.MclustDA
### Title: Summarizing discriminant analysis based on Gaussian finite
###   mixture modeling.
### Aliases: summary.MclustDA print.summary.MclustDA
### Keywords: multivariate

### ** Examples

mod = MclustDA(data = iris[,1:4], class = iris$Species)
summary(mod)
summary(mod, parameters = TRUE)



