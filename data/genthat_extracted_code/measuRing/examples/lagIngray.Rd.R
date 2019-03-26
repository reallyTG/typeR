library(measuRing)


### Name: lagIngray
### Title: First-local lag
### Aliases: lagIngray

### ** Examples

## (not run) Read one image sample in folder of package measuRing:
image1 <- system.file("P105_a.tif", package="measuRing")
##(not run) First local in the acf of smoothed grays:       
local1 <- lagIngray(image1,acf = TRUE)        
##(not run) Plot of first local over the acf: 
Flocal <- local1[['local']]
Clocal <- ts(local1[['acf']][Flocal,],start=Flocal)
acf <- ts(local1[['acf']],start=1)    
{plot(acf,type='h',col='gray',xlab='Lag',main='First local lag')
points(Clocal,pch=19,cex=0.5)}



