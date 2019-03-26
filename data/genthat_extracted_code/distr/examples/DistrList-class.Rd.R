library(distr)


### Name: DistrList-class
### Title: List of distributions
### Aliases: DistrList-class coerce,Distribution,DistrList-method
###   show,DistrList-method
### Keywords: distribution list

### ** Examples

(DL <- new("DistrList", list(Norm(), Exp())))
plot(DL)
as(Norm(), "DistrList")



