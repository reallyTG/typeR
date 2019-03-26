library(plantecophys)


### Name: fitBBs
### Title: Fit Ball-Berry type models of stomatal conductance to many
###   groups at once
### Aliases: fitBBs

### ** Examples

## Not run: 
##D # If you have a factor variable in your dataset called 'species', and you
##D # want to fit the Ball-Berry model for each of the species:
##D myfits <- fitBBs(mydata, "species", model="BallBerry")
##D 
##D # A dataframe with coefficients is returned by coef()
##D coef(myfits)
##D 
## End(Not run)



