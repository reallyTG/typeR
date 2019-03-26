library(mpoly)


### Name: mpolyEqual
### Title: Determine whether two multivariate polynomials are equal.
### Aliases: mpolyEqual ==.mpoly ==

### ** Examples


p1 <- mp("x + y + 2 z")
p1 == p1

p2 <- reorder(p1, order = "lex", varorder = c("z","y","x"))
p1 == p2
p2 <- reorder(p1, order = "lex", varorder = c("z","w","y","x"))
p1 == p2
p1 == ( 2 * p2 )

p1 <- mp("x + 1") 
p2 <- mp("x + 1")
identical(p1, p2)
p1 == p2

mp("x + 1") == mp("y + 1")
mp("2") == mp("1")
mp("1") == mp("1")
mp("0") == mp("-0")




