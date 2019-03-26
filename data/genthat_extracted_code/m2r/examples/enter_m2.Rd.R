library(m2r)


### Name: enter_m2
### Title: Enter a Macaulay2 session
### Aliases: enter_m2

### ** Examples


## Not run: 
##D  requires Macaulay2 be installed and an interactive session
##D 
##D enter_m2()
##D 
##D # m2 code below
##D 1 + 1
##D a = 1
##D a
##D R = QQ[t,x,y,z]
##D I = ideal(t^4  -  x, t^3  -  y, t^2  -  z)
##D gens gb I
##D exit
##D 
##D # back in R, the variable persists using m2()
##D m2("a")
##D m2("I")
##D 
##D 
##D # we can also define variables in R that persist in m2
##D m2("b = 5")
##D 
##D enter_m2()
##D b
##D exit
##D 
## End(Not run)




