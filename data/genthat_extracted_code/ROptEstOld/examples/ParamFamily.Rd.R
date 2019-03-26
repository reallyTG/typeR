library(ROptEstOld)


### Name: ParamFamily
### Title: Generating function for ParamFamily-class
### Aliases: ParamFamily
### Keywords: distribution

### ** Examples

F1 <- ParamFamily()
plot(F1)

## The function is currently defined as
function(name, distribution = Norm(), main = 0, nuisance, 
         trafo, param, props = character(0)){
    if(missing(name)) 
        name <- "parametric family of probability measures"
    if(missing(distrSymm)) distrSymm <- NoSymmetry()
    if(missing(param)) 
        param <- ParamFamParameter(name = paste("parameter of", name), 
                        main = main, nuisance = nuisance, trafo = trafo)
    return(new("ParamFamily", name = name, distribution = distribution, 
               distrSymm = distrSymm, param = param, props = props))
}



