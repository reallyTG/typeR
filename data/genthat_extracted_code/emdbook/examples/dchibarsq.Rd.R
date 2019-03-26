library(emdbook)


### Name: dchibarsq
### Title: Mixed chi-squared distributions
### Aliases: dchibarsq pchibarsq qchibarsq rchibarsq
### Keywords: misc

### ** Examples

x <- rchibarsq(100)
plot(density(x,from=0))
curve(dchibarsq(x),add=TRUE,col=2,from=0)
## Not run: 
##D library(lattice)
##D print(qqmath(~ simdist,
##D        distribution=qchibarsq,
##D        panel = function(x, ...) {
##D          panel.qqmathline(x, ...)
##D          panel.qqmath(x, ...)
##D             }))
##D 
## End(Not run)
## create first line of table in Goldman and Whelan 2000
round(qchibarsq(c(0.01,0.05,0.9,0.95,0.975,0.99,0.995),df=1),2)
## check second line of table
round(pchibarsq(c(3.81,5.14,6.48,8.27,9.63),df=2),3)
## create middle column
round(qchibarsq(0.95,df=1:10))



