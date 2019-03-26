library(nlts)


### Name: contingency.periodogram
### Title: The contingency periodogram for periodicity in categorical time
###   series
### Aliases: contingency.periodogram
### Keywords: ts

### ** Examples

    data(plodia)
    data<-as.factor((scale(plodia) > 0))
    fit <- contingency.periodogram(data, maxper = 9) 
    ## Not run: plot(fit)



