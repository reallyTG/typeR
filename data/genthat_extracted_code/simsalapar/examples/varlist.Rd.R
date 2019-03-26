library(simsalapar)


### Name: varlist
### Title: Variable Specification List - Generation and Class
### Aliases: varlist dimnames2varlist varlist-class
###   coerce,varlist,list-method show,varlist-method
### Keywords: classes utilities

### ** Examples

showClass("varlist")

vList <- varlist(
    n.sim = list(value = 1000, expr = quote(N[sim])), # type = N
    n     = list(type="grid", value = c(20, 100, 500)), # sample sizes
    meth  = list(type="grid", expr = quote(italic(method)),
                 value = c("classical", "robust")),
    alpha = list(value = 0.95)) # default type = "frozen"

str(vList)# note the default 'expr' for  n and alpha; and type of alpha

## For more extensive examples, see also
demo(package="simsalapar")

## coerce to simple list  .. and back :
lvl <- as(vList, "list")
stopifnot(identical(
    do.call(varlist, lvl),
    vList ))

## From a data.frame to a LaTeX table :
str(dimnames(Titanic))
vlTitan <- dimnames2varlist(dimnames(Titanic))
vlTitan  # default 'type = "grid"' here
toLatex(vlTitan)



