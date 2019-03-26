library(tolBasis)


### Name: Serie Arithmetic
### Title: Serie Arithmetic Operators
### Aliases: Arithmetic.Serie +.Serie -.Serie *.Serie /.Serie ^.Serie
### Keywords: arithmetics

### ** Examples

s1 <- Serie(rnorm(12), Monthly, Date(2015))
s2 <- Serie(rnorm(12), Monthly, Date(2015))
ss <- s1+s2
sd <- s1-s2
sp <- s1*s2
sq <- s1/s2
se <- s1^2



