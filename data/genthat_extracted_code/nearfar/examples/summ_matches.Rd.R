library(nearfar)


### Name: summ_matches
### Title: Computes table of absolute standardized differences
### Aliases: summ_matches

### ** Examples

k2 = matches(dta=mtcars, covs=c("cyl", "disp"), sinks=0.2, iv="carb",
     cutpoint=2, imp.var=c("cyl"), tol.var=0.03)
summ_matches(dta=mtcars, iv="carb", covs=c("cyl", "disp"), match=k2)




