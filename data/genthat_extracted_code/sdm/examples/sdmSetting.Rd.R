library(sdm)


### Name: sdmSetting
### Title: creating sdmSetting object
### Aliases: sdmSetting sdmSetting,ANY,sdmdata,character-method
###   show,sdmSetting-method
### Keywords: spatial,species,data

### ** Examples

## Not run: 
##D file <- system.file("external/pa_df.csv", package="sdm")
##D 
##D df <- read.csv(file)
##D 
##D head(df) 
##D 
##D d <- sdmData(sp~b15+NDVI,train=df)
##D 
##D # generate sdmSettings object:
##D s <- sdmSetting(sp~., methods=c('glm','gam','brt','svm','rf'),
##D           replication='sub',test.percent=30,n=10,modelSettings=list(brt=list(n.trees=500)))
##D 
##D s
##D 
##D 
## End(Not run)



