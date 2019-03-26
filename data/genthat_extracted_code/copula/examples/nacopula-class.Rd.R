library(copula)


### Name: nacopula-class
### Title: Class "nacopula" of Nested Archimedean Copulas
### Aliases: outer_nacopula-class nacopula-class dim,nacopula-method
### Keywords: multivariate classes

### ** Examples

## nacopula and outer_nacopula class information
showClass("nacopula")
showClass("outer_nacopula")

## Construct a three-dimensional nested Frank copula with parameters
## chosen such that the Kendall's tau of the respective bivariate margins
## are 0.2 and 0.5.
theta0 <- copFrank@iTau(.2)
theta1 <- copFrank@iTau(.5)
C3 <- onacopula("F", C(theta0, 1, C(theta1, c(2,3))))

C3 # displaying it, using show(C3); see help(printNacopula)

## What is the dimension of this copula?
dim(C3)

## What are the indices of direct components of the root copula?
C3@comp

## How does the list of child nested Archimedean copulas look like?
C3@childCops # only one child for this copula, components 2, 3




