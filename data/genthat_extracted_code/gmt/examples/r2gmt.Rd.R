library(gmt)


### Name: r2gmt
### Title: Prepare Data for GMT
### Aliases: r2gmt

### ** Examples

LonLat1 <- data.frame(Lon=1:3, Lat=4:6)
LonLat2 <- data.frame(Lon=7:8, Lat=9:10)
## Not run: 
##D r2gmt(LonLat1, "temp.gmt")
##D r2gmt(LonLat2, "temp.gmt", append=TRUE)
## End(Not run)



