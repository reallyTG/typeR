library(algstat)


### Name: m2
### Title: Evaluate Macaulay2 Code
### Aliases: m2

### ** Examples

## Not run: 
##D 
##D options(digits = 20)
##D 13^20
##D m2("13^20") # correct answer
##D m2("toRR(20,(19004963774880800571392-13^20)/13^20)") # relative error
##D options(digits = 7)
##D 
##D code <- "
##D 1+1
##D 2+3
##D 100!
##D R = QQ[x,y,z]
##D (x+y)^10
##D curve = ideal( x^4-y^5, x^3-y^7 )
##D gens gb curve
##D m = matrix {{x^2, x^2-y^2, x*y*z^7 }}
##D image m
##D R = QQ[a..d]
##D I = ideal(a^3-b^2*c, b*c^2-c*d^2, c^3)
##D G = gens gb I
##D G
##D "
##D m2(code)
##D 
##D 
##D code <- "
##D R = QQ[x,y,z,t]
##D I = ideal( t^4 - x, t^3 - y, t^2 - z)
##D gens gb I
##D "
##D m2(code)
##D 
## End(Not run)



