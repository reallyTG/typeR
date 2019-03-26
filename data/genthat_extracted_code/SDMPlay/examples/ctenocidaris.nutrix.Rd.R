library(SDMPlay)


### Name: ctenocidaris.nutrix
### Title: Records of _Ctenocidaris nutrix_ echinoid presences on the
###   Kerguelen Plateau
### Aliases: ctenocidaris.nutrix
### Keywords: datasets

### ** Examples

data(ctenocidaris.nutrix)
x <- ctenocidaris.nutrix
# plot of the occurrences:
# selecting the species according to the campaigns
ctenocidaris7475 <- base::subset(x,x$year==1974 | x$year==1975)
ctenocidaris20102015 <- base::subset(x,x$campaign=='POKER II' | x$campaign=='PROTEKER')

# drawing the background (depth)
library(grDevices)
blue.palette <- colorRampPalette(c('blue','deepskyblue','azure'))(100)
data('predictors1965_1974')
depth <- raster :: subset(predictors1965_1974, 1)

raster::plot(depth, col=blue.palette,main= "Ctenocidaris nutrix occurrences")

# adding the occurrences data to the background
points(ctenocidaris7475[,c('decimal.Longitude','decimal.Latitude')],
      col='orange',pch=16)
points(ctenocidaris20102015[,c('decimal.Longitude','decimal.Latitude')],
      col='darkgreen',pch=16)
legend('bottomleft',
       legend=c('Ctenocidaris nutrix 1974-1975','Ctenocidaris nutrix 2010-2015'),
       col= c('orange','darkgreen'), pch= c(15, 15),cex=0.9)





