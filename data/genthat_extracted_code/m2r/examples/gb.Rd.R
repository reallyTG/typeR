library(m2r)


### Name: gb
### Title: Compute a Grobner basis with Macaulay2
### Aliases: gb gb. gb_ gb_.

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D 
##D ##### basic usage
##D ########################################
##D 
##D # the last ring evaluated is the one used in the computation
##D ring("t","x","y","z", coefring = "QQ")
##D gb("t^4 - x", "t^3 - y", "t^2 - z")
##D 
##D # here's the code it's running in M2
##D gb("t^4 - x", "t^3 - y", "t^2 - z", code = TRUE)
##D 
##D 
##D 
##D ##### different versions of gb
##D ########################################
##D 
##D # standard evaluation version
##D poly_chars <- c("t^4 - x", "t^3 - y", "t^2 - z")
##D gb_(poly_chars)
##D 
##D # reference nonstandard evaluation version
##D gb.("t^4 - x", "t^3 - y", "t^2 - z")
##D 
##D # reference standard evaluation version
##D gb_.(poly_chars)
##D 
##D 
##D 
##D ##### different inputs to gb
##D ########################################
##D 
##D # ideals can be passed to gb
##D I <- ideal("t^4 - x", "t^3 - y", "t^2 - z")
##D gb_(I)
##D 
##D # note that gb() works here, too, since there is only one input
##D gb(I)
##D 
##D # ideal pointers can be passed to gb
##D I. <- ideal.("t^4 - x", "t^3 - y", "t^2 - z")
##D gb_(I.)
##D 
##D # setting raw_chars is a bit faster, because it doesn't use ideal()
##D gb("t^4 - x", "t^3 - y", "t^2 - z", raw_chars = TRUE, code = TRUE)
##D gb("t^4 - x", "t^3 - y", "t^2 - z", raw_chars = TRUE)
##D 
##D 
##D 
##D ##### more advanced usage
##D ########################################
##D 
##D # the control argument accepts a named list with additional
##D # options
##D gb_(
##D   c("t^4 - x", "t^3 - y", "t^2 - z"),
##D   control = list(StopWithMinimalGenerators = TRUE),
##D   code = TRUE
##D )
##D 
##D gb_(
##D   c("t^4 - x", "t^3 - y", "t^2 - z"),
##D   control = list(StopWithMinimalGenerators = TRUE)
##D )
##D 
##D 
##D 
##D ##### potential issues
##D ########################################
##D 
##D # when specifying raw_chars, be sure to add asterisks
##D # between variables to create monomials; that's the M2 way
##D ring("x", "y", "z", coefring = "QQ")
##D gb("x y", "x z", "x", raw_chars = TRUE, code = TRUE) # errors without code = TRUE
##D gb("x*y", "x*z", "x", raw_chars = TRUE, code = TRUE) # correct way
##D gb("x*y", "x*z", "x", raw_chars = TRUE)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
## End(Not run)



