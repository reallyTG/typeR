library(spider)


### Name: cgraph
### Title: Complete graph
### Aliases: cgraph
### Keywords: Visualisation

### ** Examples


x <- runif(15)
y <- runif(15)

graphics::plot(x, y)
cgraph(x, y)

M <- cbind(x, y)
cgraph(M[1:10,], col = "blue")




