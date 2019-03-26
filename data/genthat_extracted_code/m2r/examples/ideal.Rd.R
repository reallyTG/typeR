library(m2r)


### Name: ideal
### Title: Create a new ideal in Macaulay2
### Aliases: ideal ideal. ideal_ ideal_. print.m2_ideal print.m2_ideal_list
###   radical radical. saturate saturate. quotient quotient.
###   primary_decomposition primary_decomposition. dimension +.m2_ideal
###   *.m2_ideal ==.m2_ideal ^.m2_ideal

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D 
##D ##### basic usage
##D ########################################
##D 
##D ring("x", "y", coefring = "QQ")
##D ideal("x + y", "x^2 + y^2")
##D 
##D 
##D 
##D ##### different versions of gb
##D ########################################
##D 
##D # standard evaluation version
##D poly_chars <- c("x + y", "x^2 + y^2")
##D ideal_(poly_chars)
##D 
##D # reference nonstandard evaluation version
##D ideal.("x + y", "x^2 + y^2")
##D 
##D # reference standard evaluation version
##D ideal_.(poly_chars)
##D 
##D 
##D 
##D ##### different inputs to gb
##D ########################################
##D 
##D ideal_(   c("x + y", "x^2 + y^2") )
##D ideal_(mp(c("x + y", "x^2 + y^2")))
##D ideal_(list("x + y", "x^2 + y^2") )
##D 
##D 
##D 
##D ##### predicate functions
##D ########################################
##D 
##D I  <- ideal ("x + y", "x^2 + y^2")
##D I. <- ideal.("x + y", "x^2 + y^2")
##D is.m2_ideal(I)
##D is.m2_ideal(I.)
##D is.m2_ideal_pointer(I)
##D is.m2_ideal_pointer(I.)
##D 
##D 
##D 
##D ##### ideal radical
##D ########################################
##D 
##D I <- ideal("(x^2 + 1)^2 y", "y + 1")
##D radical(I)
##D radical.(I)
##D 
##D 
##D 
##D ##### ideal dimension
##D ########################################
##D 
##D I <- ideal_(c("(x^2 + 1)^2 y", "y + 1"))
##D dimension(I)
##D 
##D # dimension of a line
##D ring("x", "y", coefring = "QQ")
##D I <- ideal("y - (x+1)")
##D dimension(I)
##D 
##D # dimension of a plane
##D ring("x", "y", "z", coefring = "QQ")
##D I <- ideal("z - (x+y+1)")
##D dimension(I)
##D 
##D 
##D 
##D ##### ideal quotients and saturation
##D ########################################
##D 
##D ring("x", "y", "z", coefring = "QQ")
##D (I <- ideal("x^2", "y^4", "z + 1"))
##D (J <- ideal("x^6"))
##D 
##D quotient(I, J)
##D quotient.(I, J)
##D 
##D saturate(I)
##D saturate.(I)
##D saturate(I, J)
##D saturate(I, mp("x"))
##D saturate(I, "x")
##D 
##D 
##D ring("x", "y", coefring = "QQ")
##D saturate(ideal("x y"), "x^2")
##D 
##D # saturation removes parts of varieties
##D # solution over R is x = -1, 0, 1
##D ring("x", coefring = "QQ")
##D I <- ideal("(x-1) x (x+1)")
##D saturate(I, "x") # remove x = 0 from solution
##D ideal("(x-1) (x+1)")
##D 
##D 
##D 
##D ##### primary decomposition
##D ########################################
##D 
##D ring("x", "y", "z", coefring = "QQ")
##D I <- ideal("(x^2 + 1) (x^2 + 2)", "y + 1")
##D primary_decomposition(I)
##D primary_decomposition.(I)
##D 
##D I <- ideal("x (x + 1)", "y")
##D primary_decomposition(I)
##D 
##D # variety = z axis union x-y plane
##D (I <- ideal("x z", "y z"))
##D dimension(I) # =  max dimension of irreducible components
##D (Is <- primary_decomposition(I))
##D dimension(Is)
##D 
##D 
##D 
##D ##### ideal arithmetic
##D ########################################
##D 
##D ring("x", "y", "z", coefring = "RR")
##D 
##D # sums (cox et al., 184)
##D (I <- ideal("x^2 + y"))
##D (J <- ideal("z"))
##D I + J
##D 
##D # products (cox et al., 185)
##D (I <- ideal("x", "y"))
##D (J <- ideal("z"))
##D I * J
##D 
##D # equality
##D (I <- ideal("x", "y"))
##D (J <- ideal("z"))
##D I == J
##D I == I
##D 
##D # powers
##D (I <- ideal("x", "y"))
##D I^3
##D 
## End(Not run)



