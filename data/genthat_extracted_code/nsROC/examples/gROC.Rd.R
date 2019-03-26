library(nsROC)


### Name: gROC
### Title: ROC curve estimation (generalization included)
### Aliases: gROC gROC.default
### Keywords: generalROC

### ** Examples

# Basic example (side="auto") -> Output side is "right"
set.seed(123)
X <- c(rnorm(45), rnorm(30,2,1.5))
D <- c(rep(0,45), rep(1,30))
gROC(X,D)

# Basic example (side="auto") -> Output side is "left"
X <- c(rnorm(45), rnorm(30,-2,1.5))
D <- c(rep(0,45), rep(1,30))
gROC(X,D)

# General ROC curve example
X <- c(rnorm(45), rnorm(30,1,4))
D <- c(rep(0,45), rep(1,30))
gROC(X, D, side="both")

# Plot density estimates and ROC curve in the same plot
X <- c(rnorm(45), rnorm(30,2,1.5))
D <- c(rep(0,45), rep(1,30))
gROC(X, D, plot.roc=TRUE, plot.density=TRUE)



