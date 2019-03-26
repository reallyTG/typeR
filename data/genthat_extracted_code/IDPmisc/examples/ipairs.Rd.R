library(IDPmisc)


### Name: ipairs
### Title: Image Scatter Plot Matrix for Large Datasets
### Aliases: ipairs
### Keywords: hplot

### ** Examples

## Small numbers of different values are plotted nicer
## when converted to factors
AQ <- airquality
AQ$Month <- as.factor(AQ$Month)

zmax <- ipairs(AQ, pixs=2, main="Air Quality")
ipairs(AQ, pixs=2, zmax=zmax, main="Air Quality",border=TRUE)

## example with factors
ipairs(iris,pixs=2)

## a really huge dataset
## Not run: 
##D   if(require(SwissAir)) {
##D     data(AirQual)
##D 
##D     ## low correlation
##D     ipairs(AirQual[,c("ad.O3","lu.O3","sz.O3")],
##D     ztransf=function(x){x[x<1] <- 1; log2(x)})
##D 
##D     ipairs(AirQual[,c("ad.NO","lu.NO","sz.NO")],
##D     ztransf=function(x){x[x<1] <- 1; log2(x)})
##D 
##D     ## high correlation
##D     Ox <- AirQual[,c("ad.O3","lu.O3","sz.O3")]+
##D     AirQual[,c("ad.NOx","lu.NOx","sz.NOx")]-
##D     AirQual[,c("ad.NO","lu.NO","sz.NO")]
##D     names(Ox) <- c("ad","lu","sz")
##D     ipairs(Ox, ztransf=function(x){x[x<1] <- 1; log2(x)})
##D 
##D     ## cf. ?AirQual for the explanation of the physical and
##D     ## chemical background
##D   } else print("Package SwissAir is not available")
## End(Not run)



