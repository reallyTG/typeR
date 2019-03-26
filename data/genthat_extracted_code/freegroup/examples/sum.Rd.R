library(freegroup)


### Name: sum
### Title: Repeated summation by concatenation
### Aliases: sum sum.free

### ** Examples


x <- rfree(10,3)
y <- rfree(10,6)
z <- alpha(26)


sum(x)
abelianize(sum(x))


sum(x,y) == sum(sum(x),sum(y))
x+y  # not the same!

sum(x,-x)
sum(x,rev(-x))


stopifnot(sum(x^z) == sum(x)^z)




