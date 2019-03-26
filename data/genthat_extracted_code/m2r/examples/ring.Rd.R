library(m2r)


### Name: ring
### Title: Create a new ring in Macaulay2
### Aliases: ring ring. ring_ ring_. m2_coefrings m2_termorders
###   print.m2_polynomialring

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D ##### basic usage
##D ########################################
##D 
##D ring("x", "y")
##D ring("x", "y", coefring = "QQ")
##D 
##D 
##D ##### standard evaluation
##D ########################################
##D 
##D ring_(c("x", "y"))
##D ring_(c("x", "y"), code = TRUE)
##D 
##D (myring <- ring_(c("x1","x2","x3","y"), coefring = "QQ", order = "lex"))
##D 
##D m2_name(myring)
##D m2_meta(myring, "vars")
##D m2_meta(myring, "coefring")
##D m2_meta(myring, "order")
##D 
##D ##### other options
##D ########################################
##D 
##D ring_.(c("x", "y"))
##D ring_.(c("x", "y"), code = TRUE)
##D 
## End(Not run)



