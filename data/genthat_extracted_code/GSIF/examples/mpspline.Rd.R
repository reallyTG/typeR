library(GSIF)


### Name: mpspline
### Title: Fits a mass preserving spline
### Aliases: mpspline mpspline,SoilProfileCollection-method
### Keywords: methods

### ** Examples

library(aqp)
library(plyr)
library(sp)
## sample profile from Nigeria:
lon = 3.90; lat = 7.50; id = "ISRIC:NG0017"; FAO1988 = "LXp" 
top = c(0, 18, 36, 65, 87, 127) 
bottom = c(18, 36, 65, 87, 127, 181)
ORCDRC = c(18.4, 4.4, 3.6, 3.6, 3.2, 1.2)
munsell = c("7.5YR3/2", "7.5YR4/4", "2.5YR5/6", "5YR5/8", "5YR5/4", "10YR7/3")
## prepare a SoilProfileCollection:
prof1 <- join(data.frame(id, top, bottom, ORCDRC, munsell), 
         data.frame(id, lon, lat, FAO1988), type='inner')
depths(prof1) <- id ~ top + bottom
site(prof1) <- ~ lon + lat + FAO1988 
coordinates(prof1) <- ~ lon + lat
proj4string(prof1) <- CRS("+proj=longlat +datum=WGS84")
## fit a spline:
ORCDRC.s <- mpspline(prof1, var.name="ORCDRC")
str(ORCDRC.s)

## Example with multiple soil profiles
## Make some fake, but reasonable profiles:
rand.prof <- ldply(1:20, random_profile, n=c(6, 7, 8), n_prop=1, method='LPP')
## promote to SPC and plot
depths(rand.prof ) <- id ~ top + bottom
plot(rand.prof, color='p1')
## fit MP spline by profile
try( m <- mpspline(rand.prof, 'p1') )



