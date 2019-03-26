library(RCALI)


### Name: crlistpoly
### Title: Create an object of class 'listpoly' from objects of class
###   'poly'
### Aliases: crlistpoly
### Keywords: data

### ** Examples

# A triangle:
a <- as.poly(matrix(c(2,2,2,3,3,3), ncol=2, byrow=TRUE))
# A square:
b <- as.poly(matrix(c(2.5,2,2.5,2.5,3,2.5,3,2), ncol=2, byrow=TRUE))
# The both:
 z <- crlistpoly(a,b)



