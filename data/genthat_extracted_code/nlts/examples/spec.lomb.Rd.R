library(nlts)


### Name: spec.lomb
### Title: The Lomb periodogram for unevenly sampled data
### Aliases: spec.lomb
### Keywords: ts

### ** Examples


   data(plodia)

    y <- sqrt(plodia)
    x <- 1:length(y) 

    #make some missing values
    y[10:19] <- NA; x[10:19] <- NA 
    #omit NAs
    y <- na.omit(y); x <- na.omit(x) 

    #the lomb p'gram
    fit <- spec.lomb(y, x) 
    summary(fit)
    ## Not run: plot(fit)



