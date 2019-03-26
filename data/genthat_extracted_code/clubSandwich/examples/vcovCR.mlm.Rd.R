library(clubSandwich)


### Name: vcovCR.mlm
### Title: Cluster-robust variance-covariance matrix for an mlm object.
### Aliases: vcovCR.mlm

### ** Examples

iris_fit <- lm(cbind(Sepal.Length, Sepal.Width) ~ Species + 
               Petal.Length + Petal.Width, data = iris)
Vcluster <- vcovCR(iris_fit, type = "CR2")




