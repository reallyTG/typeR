library(Daim)


### Name: deLong.test
### Title: DeLong test
### Aliases: deLong.test
### Keywords: classif

### ** Examples



y <- rbinom(100, 1, .5)
x1 <- rnorm(100) + 1.5 * y
x2 <- rnorm(100) + .5 * y
x3 <- rnorm(100) + 2.5 * y
x <- data.frame(x1,x2,x3)
y <- as.factor(y)

(M1 <- deLong.test(x, labels=y, labpos="1"))



## Not run: 
##D   
##D ## just because of checking time on CRAN
##D   
##D 
##D data(iris)
##D (M2 <- deLong.test(iris[,1:4], labels=iris[,5], labpos="versicolor"))
## End(Not run)



