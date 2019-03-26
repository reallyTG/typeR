library(ppgmmga)


### Name: ppgmmga
### Title: Projection pursuit based on Gaussian mixtures and evolutionary
###   algorithms for data visualisation
### Aliases: ppgmmga print.ppgmmga

### ** Examples


data(iris)
X <- iris[,-5]
Class <- iris$Species

# Unscented Transformation approximation (default)
pp1 <- ppgmmga(data = X, d = 2, approx = "UT", seed = 123)
summary(pp1, check = TRUE)
plot(pp1, Class)

## Not run: 
##D # VARiational approximation
##D pp2 <- ppgmmga(data = X, d = 2, approx = "VAR")
##D summary(pp2, check = TRUE)
##D plot(pp2, Class)
##D 
##D # Second Order Taylor Expansion approximation
##D pp3 <- ppgmmga(data = X, d = 2, approx = "SOTE")
##D summary(pp3, check = TRUE)
##D plot(pp3, Class)
## End(Not run)



