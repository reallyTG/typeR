library(NADA)


### Name: quantile-methods
### Title: Methods for function quantile in Package NADA
### Aliases: quantile-methods quantile,ANY-method quantile,cenfit-method
###   quantile,ros-method quantile,cenmle-method
###   quantile,cenmle-lognormal-method quantile,cenmle-gaussian-method
###   NADAprobs
### Keywords: methods

### ** Examples

    data(Cadmium)

    mymodel = cenfit(Cadmium$Cd, Cadmium$CdCen, Cadmium$Region)

    quantile(mymodel, conf.int=TRUE)



