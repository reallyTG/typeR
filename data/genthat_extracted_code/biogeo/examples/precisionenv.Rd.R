library(biogeo)


### Name: precisionenv
### Title: Check precision of records
### Aliases: precisionenv

### ** Examples

## Not run: 
##D dem<-raster(dem,xmn=-180, xmx=180, ymn=-60, ymx=90)
##D datpce <- precisionenv(dat, dem, x='x', y='y')
##D datpce[datpce$envpreci==1,] #View records with possible precision problems
## End(Not run)



