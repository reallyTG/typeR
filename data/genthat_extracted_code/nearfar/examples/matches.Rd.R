library(nearfar)


### Name: matches
### Title: Function to find pair matches using a distance matrix.  Called
###   by 'opt_nearfar' to discover optimal near-far matches.
### Aliases: matches

### ** Examples

k2 = matches(dta=mtcars, covs=c("cyl", "disp"), sinks=0.2, iv="carb",
    cutpoint=2, imp.var=c("cyl"), tol.var=0.03)
k2[1:5, ]



