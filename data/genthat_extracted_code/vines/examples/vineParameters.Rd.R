library(vines)


### Name: vineParameters
### Title: Parameters of a Vine
### Aliases: vineParameters vineParameters<-

### ** Examples

dimension <- 5
copulas <- matrix(c(list(tCopula(-0.25, df = 2),
                         tCopula(-0.5, df = 4),
                         tCopula(0.25, df = 6),
                         tCopula(0.5, df = 8)),
                    rep(list(NULL), 12)),
                  ncol = dimension - 1, 
                  nrow = dimension - 1,
                  byrow = TRUE)
vine <- DVine(dimension = dimension, trees = 1, 
              copulas = copulas)
dimnames(vine) <- c("A", "B", "C", "D", "E")

vineParameters(vine)
show(vine)

vineParameters(vine) <- c(-0.25, 3, -0.5, 5, 0.25, 7, 0.5, 9)

vineParameters(vine)
show(vine)



