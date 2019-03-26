library(biogeo)


### Name: elevcheck
### Title: Elevation check
### Aliases: elevcheck

### ** Examples

## Not run: 
##D gb <- keepmainfields(gbifdat,ID='',Species='species',x='decimallongitude',y='decimallatitude',
##D others=c('gbifid','elevation')) # Convert example data to biogeo format
##D gb <- gb[ gb$Species=='Heterotheca villosa', ] # Keep data for only one species
##D dem<-raster(dem,xmn=-180, xmx=180, ymn=-60, ymx=90)
##D gba<-elevcheck(gb,dem,elevc="elevation",diff=50)
## End(Not run)



