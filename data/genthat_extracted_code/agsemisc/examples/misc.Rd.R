library(agsemisc)


### Name: misc helpers
### Title: Misc R helper functions
### Aliases: eqc grep.b grep.s or.else orderavg tableNA printn tracebck
### Keywords: manip

### ** Examples

## Not run: plot(rnorm(8)~runif(8),xlim=c(10,NA))
## Not run: traceback()
## Not run: tracebck()

data(iris)
xyplot(Sepal.Width ~ Sepal.Length | eqc(Sepal.Length),
       subset=grep.b("v",Species), data=iris)

x = c(4,9,NA,4,4,27,NA,27)
table(or.else(x,88))
table(x)
tableNA(x)

printn(levels(iris$Species))



