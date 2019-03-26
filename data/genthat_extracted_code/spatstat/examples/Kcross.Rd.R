library(spatstat)


### Name: Kcross
### Title: Multitype K Function (Cross-type)
### Aliases: Kcross
### Keywords: spatial nonparametric

### ** Examples

    # amacrine cells data
    K01 <- Kcross(amacrine, "off", "on") 
    plot(K01)

    ## Don't show: 
    K01 <- Kcross(amacrine, "off", "on", ratio=TRUE) 
    
## End(Don't show)
    ## Not run: 
##D     K10 <- Kcross(amacrine, "on", "off")
##D 
##D     # synthetic example: point pattern with marks 0 and 1
##D     pp <- runifpoispp(50)
##D     pp <- pp %mark% factor(sample(0:1, npoints(pp), replace=TRUE))
##D     K <- Kcross(pp, "0", "1")
##D     K <- Kcross(pp, 0, 1) # equivalent
##D     
## End(Not run)



