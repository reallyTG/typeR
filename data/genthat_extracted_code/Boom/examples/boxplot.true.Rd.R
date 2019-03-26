library(Boom)


### Name: boxplot.true
### Title: Compare Boxplots to True Values
### Aliases: boxplot.true BoxplotTrue
### Keywords: hplot

### ** Examples

x <- t(matrix(rnorm(5000, 1:5, 1:5), nrow=5))
BoxplotTrue(x, truth=1:5, se.truth=1:5, col=rainbow(5), vnames =
  c("EJ", "TK", "JT", "OtherEJ", "TJ") )



