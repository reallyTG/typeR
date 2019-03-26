library(ggm)


### Name: fitDag
### Title: Fitting of Gaussian DAG models
### Aliases: fitDag
### Keywords: graphs models multivariate

### ** Examples

dag <- DAG(y ~ x+u, x ~ z, z ~ u)
"S" <- structure(c(2.93, -1.7, 0.76, -0.06,
                   -1.7, 1.64, -0.78, 0.1,
                    0.76, -0.78, 1.66, -0.78,
                    -0.06, 0.1, -0.78, 0.81), .Dim = c(4,4),
         .Dimnames = list(c("y", "x", "z", "u"), c("y", "x", "z", "u")))
fitDag(dag, S, 200)



