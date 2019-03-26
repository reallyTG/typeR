library(copula)


### Name: acopula-class
### Title: Class "acopula" of Archimedean Copula Families
### Aliases: acopula-class acopula initialize,acopula-method
###   show,acopula-method
### Keywords: multivariate classes

### ** Examples

## acopula class information
showClass("acopula")

## Information and structure of Clayton copulas
copClayton
str(copClayton)

## What are admissible parameters for Clayton copulas?
copClayton@paraInterval

## A Clayton "acopula" with Kendall's tau = 0.8 :
(cCl.2 <- setTheta(copClayton, iTau(copClayton, 0.8)))

## Can two Clayton copulas with parameters theta0 and theta1 be nested?
## Case 1: theta0 = 3, theta1 = 2
copClayton@nestConstr(theta0 = 3, theta1 = 2)
## -> FALSE as the sufficient nesting criterion is not fulfilled
## Case 2: theta0 = 2, theta1 = 3
copClayton@nestConstr(theta0 = 2, theta1 = 3) # TRUE

## For more examples, see  help("acopula-families")



