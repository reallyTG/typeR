library(spatstat)


### Name: psst
### Title: Pseudoscore Diagnostic For Fitted Model against General
###   Alternative
### Aliases: psst
### Keywords: spatial models

### ** Examples

    data(cells)
    fit0 <- ppm(cells, ~1) # uniform Poisson
    ## Don't show: 
fit0 <- ppm(cells, ~1, nd=8)
## End(Don't show)
    G0 <- psst(fit0, Gest)
    G0
    if(interactive()) plot(G0)



