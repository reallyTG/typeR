library(SDMPlay)


### Name: brisaster.antarcticus
### Title: Records of _Brisaster antarcticus_ echinoid presences on the
###   Kerguelen Plateau
### Aliases: brisaster.antarcticus
### Keywords: datasets

### ** Examples

data(brisaster.antarcticus)
x <- brisaster.antarcticus

# plot of the occurrences:
# selecting the species according to the campaigns
brisaster7475 <- subset(x,x$year==1974 | x$year==1975)
brisaster20102015 <- subset(x,x$campaign=='POKER II'| x$campaign=='PROTEKER')

# drawing the background (depth)
library(grDevices)
blue.palette <- colorRampPalette(c('blue','deepskyblue','azure'))(100)
data('predictors1965_1974')
depth <- raster :: subset(predictors1965_1974, 1)

raster::plot(depth, col=blue.palette,main= "Brisaster antarcticus occurrences")

# adding the occurrence data to the background
points(brisaster7475[,c('decimal.Longitude','decimal.Latitude')],
      col='orange',pch=16)
points(brisaster20102015[,c('decimal.Longitude','decimal.Latitude')],
      col='darkgreen',pch=16)
legend('bottomleft',
       legend=c('Brisaster antarcticus 1974-1975','Brisaster antarcticus 2010-2015'),
       col= c('orange','darkgreen'), pch= c(15, 15),cex=0.9)





