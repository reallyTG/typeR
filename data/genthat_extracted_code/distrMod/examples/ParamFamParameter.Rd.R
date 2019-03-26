library(distrMod)


### Name: ParamFamParameter
### Title: Generating function for ParamFamParameter-class
### Aliases: ParamFamParameter
### Keywords: models

### ** Examples

ParamFamParameter(main = 0, nuisance = 1, fixed = 2,
                  trafo = function(x) list(fval = sin(x), 
                                            mat = matrix(cos(x),1,1))
                  )                          




