library(ROMIplot)


### Name: ROMIplot-package
### Title: Plots Surfaces of Rates of Mortality Improvement
### Aliases: ROMIplot-package ROMIplot
### Keywords: package

### ** Examples

## Not run: 
##D AUTdata <- readHMDformat(CNTRY = "AUT", username=HMDusername, password=HMDpassword)
##D 
##D Dth.matrix <- create.Lexis.matrix(AUTdata[["deaths"]], Sex="Female", minage=50,
##D                                 maxage=100, minyear=1950,
##D                                   maxyear=2011)
##D Expo.matrix <- create.Lexis.matrix(AUTdata[["exposures"]], Sex="Female", minage=50,
##D                                 maxage=100, minyear=1950,
##D                                   maxyear=2011)
##D AUT.1950.2011 <- ROMI.plot(Dx=Dth.matrix, Nx=Expo.matrix, smooth=TRUE)
## End(Not run)



