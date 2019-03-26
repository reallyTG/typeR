library(fungible)


### Name: orderFactors
### Title: Order factor-loadings matrix by the sum of squared factor
###   loadings
### Aliases: orderFactors

### ** Examples

## Not run: 
##D Loadings <- 
##D   matrix(c(.49, .41, .00, .00,
##D            .73, .45, .00, .00,
##D            .47, .53, .00, .00,
##D            .54, .00, .66, .00,
##D            .60, .00, .38, .00,
##D            .55, .00, .66, .00,
##D            .39, .00, .00, .68,
##D            .71, .00, .00, .56,
##D            .63, .00, .00, .55), 
##D          nrow = 9, ncol = 4, byrow = TRUE)
##D          
##D fungible::orderFactors(Lambda = Loadings,
##D                         PhiMat = NULL)$Lambda
## End(Not run)




