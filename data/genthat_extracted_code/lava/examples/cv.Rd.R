library(lava)


### Name: cv
### Title: Cross-validation
### Aliases: cv

### ** Examples

f0 <- function(data,...) lm(...,data)
f1 <- function(data,...) lm(Sepal.Length~Species,data)
f2 <- function(data,...) lm(Sepal.Length~Species+Petal.Length,data)
x <- cv(list(m0=f0,m1=f1,m2=f2),rep=10, data=iris, formula=Sepal.Length~.)
x2 <- cv(list(f0(iris),f1(iris),f2(iris)),rep=10, data=iris)



