library(ape)


### Name: mantel.test
### Title: Mantel Test for Similarity of Two Matrices
### Aliases: mantel.test
### Keywords: multivariate

### ** Examples

q1 <- matrix(runif(36), nrow = 6)
q2 <- matrix(runif(36), nrow = 6)
diag(q1) <- diag(q2) <- 0
mantel.test(q1, q2, graph = TRUE,
            main = "Mantel test: a random example with 6 X 6 matrices
representing asymmetric relationships",
            xlab = "z-statistic", ylab = "Density",
            sub = "The vertical line shows the observed z-statistic")



