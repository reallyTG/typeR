library(edci)


### Name: oregMclust
### Title: Orthogonal Regression Clustering
### Aliases: oregMclust regparm plot.oregMclust print.oregMclust
### Keywords: cluster regression robust

### ** Examples

  x = c(rnorm(100, 0, 3), rnorm(100, 5, 3))
  y = c(-2 * x[1:100] - 5, 0.5 * x[101:200] + 30)/2
  x = x + rnorm(200, 0, 0.5)
  y = y + rnorm(200, 0, 0.5)

  reg = oregMclust(x, y, 1, method = "prob")
  reg = projMclust(reg, x, y)
  reg
  plot(bestMclust(reg, 2, crit = "proj"), x, y)



