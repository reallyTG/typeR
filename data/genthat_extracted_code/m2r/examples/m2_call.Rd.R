library(m2r)


### Name: m2_call
### Title: Call and reset a Macaulay2 process
### Aliases: m2_call m2r_version_number start_m2 stop_m2 reset_m2 m2 m2.
###   print.m2_pointer

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D m2("1 + 1")
##D m2.("1 + 1")
##D 
##D m2("factor 32004")
##D 
##D # run a chunk of m2 code, only pulling the end value back into R
##D m2("
##D   R = QQ[a..d]
##D   I = ideal(a^3-b^2*c, b*c^2-c*d^2, c^3)
##D   G = gens gb I
##D ")
##D 
##D # illustrate the persistent connection
##D m2("a = 1 + 1")
##D m2("a")
##D reset_m2()
##D m2("a")
##D 
##D 
##D 
##D m2.("peek(QQ[x,y,z])")
##D m2("peek(QQ[x,y,z])")
##D 
##D # m2 returns in its ext_str position the result of running
##D # toExternalString on the return value of the chunk of code
##D # you run. in principle, toExternalString provides the code
##D # needed to recreate the m2 object of interest. however,
##D # does not work for all objects represtable in the m2 language.
##D # in particular, mutable objects are not supported.
##D # this is what happens when you look at those:
##D m2.("new MutableList from {1,2,3}")
##D m2("new MutableList from {1,2,3}")
##D 
## End(Not run)



