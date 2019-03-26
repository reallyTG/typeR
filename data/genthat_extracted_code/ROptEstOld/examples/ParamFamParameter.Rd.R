library(ROptEstOld)


### Name: ParamFamParameter
### Title: Generating function for ParamFamParameter-class
### Aliases: ParamFamParameter
### Keywords: robust

### ** Examples

ParamFamParameter(main = 0, nuisance = 1, trafo = diag(c(1,2)))

## The function is currently defined as
function(name, main = numeric(0), nuisance, trafo){
    if(missing(name))
        name <- "parameter of a parametric family of probability measures"
    if(missing(nuisance))
        nuisance <- NULL
    if(missing(trafo))
        trafo <- diag(length(main)+length(nuisance))

    return(new("ParamFamParameter", name = name, main = main, 
               nuisance = nuisance, trafo = trafo))
}



