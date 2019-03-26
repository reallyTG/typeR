library(edci)


### Name: circMclust
### Title: Circular Clustering
### Aliases: circMclust plot.circMclust print.circMclust
### Keywords: cluster regression robust

### ** Examples

  z = (1:100 * pi)/50
  x = c(sin(z) * 10 + 20, sin(z) * 30 + 80) + rnorm(200,0,2)
  y = c(cos(z) * 10 + 20, cos(z) * 30 + 80) + rnorm(200,0,2)

  circ = circMclust(x, y, 5, method = "prob",
    prec = 1, nsc = 20, minsd = 10, maxsd = 40)
  bestMclust(circ, 2)
  plot(bestMclust(circ, 2), x, y)



