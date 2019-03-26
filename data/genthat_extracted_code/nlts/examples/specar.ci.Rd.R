library(nlts)


### Name: specar.ci
### Title: Confidence interval for the ar-spectrum and the dominant period.
### Aliases: specar.ci
### Keywords: ts

### ** Examples


   data(plodia)


    fit <- specar.ci(sqrt(plodia), order=3, resamp=10) 

    ## Not run: plot(fit, period=FALSE)

    summary(fit)



