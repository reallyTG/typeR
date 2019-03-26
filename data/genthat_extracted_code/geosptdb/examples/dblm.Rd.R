library(geosptdb)


### Name: dblm
### Title: Adjusting distance-based linear regression model
### Aliases: dblm
### Keywords: principal coordinates

### ** Examples

# considering 10 principal coordinates (constructed from a distance-based linear 
# regression model)
## Not run: 
##D data(croatia.temp)
##D data(croatiadb)
##D croatia.temp[,7] <- as.factor(croatia.temp[,7])
##D dblm1 <- dblm(data=croatia.temp,y=croatiadb$MTEMP) 
##D str(dblm1)
## End(Not run)



