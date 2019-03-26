## ----initialize, echo = FALSE--------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(xtractomatic)

## ----install,eval=FALSE--------------------------------------------------
#  install.packages("httr", dependencies = TRUE)
#  install.packages("ncdf4",dependencies = TRUE)
#  install.packages("readr", dependencies = TRUE)
#  install.packages("sp", dependencies = TRUE)

## ----installCRAN,eval=FALSE----------------------------------------------
#  install.packages("xtractomatic")

## ----installGit,eval=FALSE-----------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("rmendels/xtractomatic")

## ----load,eval=FALSE-----------------------------------------------------
#  library("xtractomatic")

## ----loadpacks,eval=FALSE------------------------------------------------
#  library("DT")
#  library("ggplot2")
#  library("lubridate")
#  library("mapdata")
#  library("reshape2")

## ----MarlinTag-----------------------------------------------------------
require(xtractomatic)
str(Marlintag38606)

## ----getMarlinChl, eval = FALSE------------------------------------------
#  require(xtractomatic)
#  
#  # First we will copy the Marlintag38606 data into a variable
#  # called tagData  so that subsequent code will be more generic.
#  
#  tagData <- Marlintag38606
#  xpos <- tagData$lon
#  ypos <- tagData$lat
#  tpos <- tagData$date
#  swchl <- xtracto("swchla8day", xpos, ypos, tpos = tpos, , xlen = .2, ylen = .2)

## ----getMarlinChl1, echo = FALSE, warning = FALSE------------------------
require(xtractomatic)

# First we will copy the Marlintag38606 data into a variable 
# called tagData  so that subsequent code will be more generic.  

tagData <- Marlintag38606
xpos <- tagData$lon
ypos <- tagData$lat
tpos <- tagData$date
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     swchl <- try(xtracto("swchla8day", xpos, ypos, tpos = tpos,  xlen = .2, ylen = .2))
     if (!class(swchl) == "try-error") {
       goodtry <- 1
     }
  }

## ----swchlStr------------------------------------------------------------
str(swchl)

## ----meantrackPlot, fig.align = 'center', fig.width = 6, fig.height = 4----
require(ggplot2)
require(mapdata)
# First combine the two dataframes (the input and the output) into one, 
# so it will be easy to take into account the locations that didn’t 
# retrieve a value.

alldata <- cbind(swchl, tagData)

# adjust the longitudes to be (-180,180)
alldata$lon <- alldata$lon - 360
# Create a variable that shows if chla is missing
alldata$missing <- is.na(alldata$mean) * 1
colnames(alldata)[1] <- 'mean'
# set limits of the map
ylim <- c(15, 30)
xlim <- c(-160, -105)
# get outline data for map
w <- map_data("worldHires", ylim = ylim, xlim = xlim)
# plot using ggplot
myColor <- colors$algae
z <- ggplot(alldata,aes(x = lon, y = lat)) + 
   geom_point(aes(colour = mean, shape = factor(missing)), size = 2.) + 
   scale_shape_manual(values = c(19, 1))
z + geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") + 
  theme_bw() + 
  scale_colour_gradientn(colours = myColor, limits = c(0., 0.32), "Chla") + 
  coord_fixed(1.3, xlim = xlim, ylim = ylim) + ggtitle("Mean chla values at marlin tag locations")


## ----mediantrackPlot, fig.align= 'center', fig.width = 6,fig.height = 4----
require(ggplot2)
colnames(alldata)[10] <- 'median'
# plot using ggplot
myColor <- colors$algae
z <- ggplot(alldata,aes(x = lon,y = lat)) + 
   geom_point(aes(colour = median,shape = factor(missing)), size = 2.) + 
  scale_shape_manual(values = c(19, 1))
z + geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") + 
  theme_bw() + 
  scale_colour_gradientn(colours = myColor, limits = c(0., 0.32), "Chla") + 
  coord_fixed(1.3, xlim = xlim, ylim = ylim) + ggtitle(" Median chla values at marlin tag locations")

## ----topotag, eval = FALSE-----------------------------------------------
#  require("xtractomatic")
#  ylim <- c(15, 30)
#  xlim <- c(-160, -105)
#  topo <- xtracto("ETOPO180", tagData$lon, tagData$lat, xlen = .1, ylen = .1)

## ----topotag1, echo = FALSE, warning = FALSE-----------------------------
require("xtractomatic")
ylim <- c(15, 30)
xlim <- c(-160, -105)
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     topo <- try(xtracto("ETOPO180", tagData$lon, tagData$lat, xlen = .1, ylen = .1), silent = TRUE)
     if (!class(topo) == "try-error") {
       goodtry <- 1
     }
  }


## ----topotagPlot, fig.align = 'center', fig.width = 6, fig.height = 4, warning = FALSE----
require("ggplot2")
alldata <- cbind(topo, tagData)
alldata$lon <- alldata$lon - 360
colnames(alldata)[1] <- 'mean'
z <- ggplot(alldata, aes(x = lon,y = lat)) + 
   geom_point(aes(colour = mean), size = 2.) + 
  scale_shape_manual(values = c(19, 1))
z + geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") + 
  theme_bw() + 
  scale_colour_gradient("Depth") + 
  coord_fixed(1.3, xlim = xlim, ylim = ylim) + ggtitle("Bathymetry at marlin tag locations")


## ----marlinTxt, results = "hide"-----------------------------------------

system.file("extdata", "Marlin-tag38606.txt", package = "xtractomatic")


## ------------------------------------------------------------------------
datafile <- system.file("extdata", "Marlin-tag38606.txt", package = "xtractomatic")
system(paste("head -n5 ", datafile))


## ------------------------------------------------------------------------

Marlingtag38606 <- read.csv(datafile, head = TRUE, stringsAsFactors = FALSE, sep = "\t")
str(Marlingtag38606)

## ---- eval = FALSE-------------------------------------------------------
#  Marlintag38606$date <- as.Date(Marlintag38606$date, format='%m/%d/%Y')

## ---- eval = FALSE-------------------------------------------------------
#  xrad <- abs(Marlintag38606$higLon - Marlintag38606$lowLon)
#  yrad <- abs(Marlintag38606$higLat - Marlintag38606$lowLat)

## ---- eval = FALSE-------------------------------------------------------
#  xpos <- Marlintag38606$lon
#  ypos <- Marlintag38606$lat
#  tpos <- Marlintag38606$date
#  swchl <- xtracto(xpos, ypos, tpos, "swchla8day", xrad, yrad)

## ----setLims3D-----------------------------------------------------------
xpos <- c(235, 240)
ypos <- c(36, 39)
tpos <- c('1998-01-01', '2014-11-30') 

## ----SeaWiFS, eval = FALSE-----------------------------------------------
#  require(xtractomatic)
#  tpos <- c("1998-01-16", "last")
#  SeaWiFS <- xtracto_3D('swchlamday', xpos, ypos, tpos = tpos)

## ----SeaWiFS1, echo = FALSE, warning = FALSE-----------------------------
require(xtractomatic)
tpos <- c("1998-01-16", "last")
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     SeaWiFS <- try(xtracto_3D('swchlamday', xpos, ypos, tpos = tpos), silent = TRUE)
     if (!class(SeaWiFS) == "try-error") {
       goodtry <- 1
     }
  }

## ----MODISgetInfo--------------------------------------------------------
require(xtractomatic)
getInfo('mhchlamday')

## ----MODISchla, eval = FALSE---------------------------------------------
#  require(xtractomatic)
#  tpos <- c('2003-01-16', "last")
#  MODIS <- xtracto_3D('mhchlamday', xpos, ypos, tpos = tpos)

## ----MODISchla1, echo = FALSE, warning = FALSE---------------------------
require(xtractomatic)
tpos <- c('2003-01-16', "last")
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     MODIS <- try(xtracto_3D('mhchlamday', xpos, ypos, tpos = tpos), silent = TRUE)
     if (!class(MODIS) == "try-error") {
       goodtry <- 1
     }
  }


## ----VIIRSchla, eval = FALSE---------------------------------------------
#  require(xtractomatic)
#  tpos <- c("2012-01-15", "last")
#  VIIRS <- xtracto_3D('erdVH3chlamday', xpos, ypos, tpos = tpos)

## ----VIIRSchla1, echo = FALSE, warning = FALSE---------------------------
require(xtractomatic)
tpos <- c("2012-01-15", "last")
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     VIIRS <- try(xtracto_3D('erdVH3chlamday', xpos, ypos, tpos = tpos), silent = TRUE)
     if (!class(VIIRS) == "try-error") {
       goodtry <- 1
     }
  }


## ----mapFrame------------------------------------------------------------
mapFrame <- function(longitude, latitude, chla){
  dims <- dim(chla)
  chla <- array(chla, dims[1] * dims[2])
  longitude <- longitude - 360
  chlaFrame <- expand.grid(x = longitude, y = latitude)
  chlaFrame$chla <- chla
  return(chlaFrame)
}

## ----plotFrame-----------------------------------------------------------
plotFrame <- function(chlaFrame, xlim, ylim, title, logplot = TRUE){
  require(mapdata)
  require(ggplot2)
  w <- map_data("worldHires", ylim = ylim, xlim = xlim)
  myplot <- ggplot(data = chlaFrame, aes(x = x, y = y, fill = chla)) +
    geom_raster(interpolate = FALSE, na.rm = TRUE) +
    geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") +
    theme_bw() + ylab("latitude") + xlab("longitude") +
    coord_fixed(1.3, xlim = xlim, ylim = ylim)
  if (logplot) {
     my.col <- colors$algae
    myplot <- myplot + scale_fill_gradientn(colours = my.col, na.value = NA, limits = c(-2, 4.5)) +
      ggtitle(title)
    }else{
      my.col <- colors$algae
     myplot <- myplot + scale_fill_gradientn(colours = my.col, na.value = NA) +
       ggtitle(title)
  }
  return(myplot)
}

## ----VIIRSPlot, fig.width = 5, fig.height = 5, fig.align = 'center'------
require(lubridate)
xlim <- c(235, 240) - 360
ylim <- c(36, 39)
ttext <- VIIRS$time[month(VIIRS$time) == 6 & year(VIIRS$time) == 2012]
chlaFrame <- mapFrame(VIIRS$longitude,VIIRS$latitude,VIIRS$data[, , month(VIIRS$time) == 6 & year(VIIRS$time) == 2012])
chlaPlot <- plotFrame(chlaFrame, xlim, ylim, paste("VIIRS chla", ttext), logplot = FALSE)
chlaPlot

## ----VIIRSLogPlot, fig.width = 5, fig.height = 5, fig.align = 'center'----
xlim <- c(235, 240) - 360
ylim <- c(36, 39)
chlalogFrame <- mapFrame(VIIRS$longitude,VIIRS$latitude,
                       log(VIIRS$data[, , month(VIIRS$time) == 6 & year(VIIRS$time) == 2012]))
chlalogPlot <- plotFrame(chlalogFrame, xlim, ylim, paste("VIIRS log(chla)", ttext))
chlalogPlot

## ----MODISLogPlot, fig.width = 5, fig.height = 5, fig.align = 'center'----
xlim <- c(235, 240) - 360
ylim <- c(36, 39)
ttext <- MODIS$time[month(MODIS$time) == 6 & year(MODIS$time) == 2012]
chlalogFrame <- mapFrame(MODIS$longitude, MODIS$latitude,
                       log(MODIS$data[, , month(MODIS$time) == 6 & year(MODIS$time) == 2012]))
chlalogPlot <- plotFrame(chlalogFrame, xlim, ylim, paste("MODIS log(chla)", ttext))
chlalogPlot


## ----SeaWiFSLogPlot, fig.width = 5, fig.height = 5, fig.align = 'center'----
xlim <- c(235, 240) - 360
ylim <- c(36, 39)
ttext <- SeaWiFS$time[month(SeaWiFS$time) == 6 & year(SeaWiFS$time) == 2010]
chlalogFrame <- mapFrame(SeaWiFS$longitude, SeaWiFS$latitude,
                       log(SeaWiFS$data[, , month(SeaWiFS$time) == 6 & year(SeaWiFS$time) == 2010]))
chlalogPlot <- plotFrame(chlalogFrame, xlim, ylim, paste("SeaWiFS log(chla)", ttext))
chlalogPlot

## ----chlaAvgset, fig.width = 5, fig.height = 3, fig.align='center'-------
require(ggplot2)
require(mapdata)
xlim1 <- c(-123.5, -123) + 360
ylim1 <- c(38, 38.5)
w <- map_data("worldHires", ylim = c(37.5, 39), xlim = c(-123.5, -122.))
z <- ggplot() + geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") +
   theme_bw() +
   coord_fixed(1.3, xlim = c(-123.5, -122.), ylim = c(37.5, 39))
z + geom_rect(aes(xmin = -123.5, xmax = -123., ymin = 38., ymax = 38.5), colour = "black", alpha = 0.) +
  theme_bw() + ggtitle("Location of chla averaging")

## ----chlaAvg-------------------------------------------------------------
chlaAvg <- function(longitude, latitude, chlaData, xlim, ylim, sTimes){
  xIndex <- xlim
  yIndex <- ylim
  yIndex[1] <- which.min(abs(latitude - ylim[1]))
  yIndex[2] <- which.min(abs(latitude - ylim[2]))
  xIndex[1] <- which.min(abs(longitude - xlim[1]))
  xIndex[2] <- which.min(abs(longitude - xlim[2]))
  tempData <- chlaData[xIndex[1]:xIndex[2], yIndex[1]:yIndex[2],]
  chlaAvg <- apply(tempData, 3, mean, na.rm = TRUE)
  chlaAvg <- data.frame(chla = chlaAvg, time = sTimes)
return(chlaAvg)
}


## ----AverageChla---------------------------------------------------------
xlim1 <- c(-123.5, -123) + 360
ylim1 <- c(38, 38.5)
# Get both the average, and the average of log transformed chl for each point in the time series 
SeaWiFSavg <- chlaAvg(SeaWiFS$longitude, SeaWiFS$latitude, SeaWiFS$data, xlim1, ylim1,SeaWiFS$time)
SeaWiFSlog <- chlaAvg(SeaWiFS$longitude, SeaWiFS$latitude, log(SeaWiFS$data), xlim1, ylim1, SeaWiFS$time)
# Run the same steps again for the MODIS and VIIRS datasets
MODISavg <- chlaAvg(MODIS$longitude, MODIS$latitude, MODIS$data, xlim1, ylim1, MODIS$time)
MODISlog <- chlaAvg(MODIS$longitude, MODIS$latitude, log(MODIS$data), xlim1, ylim1, MODIS$time)
# run the same for VIIRS
VIIRSavg <- chlaAvg(VIIRS$longitude, VIIRS$latitude, VIIRS$data, xlim1, ylim1, VIIRS$time)
VIIRSlog <- chlaAvg(VIIRS$longitude, VIIRS$latitude, log(VIIRS$data), xlim1, ylim1, VIIRS$time)

## ----plotChlaTS, fig.width = 8, fig.height = 4, fig.align = 'center'-----
require(ggplot2)
Chla <- rbind(VIIRSavg, MODISavg, SeaWiFSavg)
Chla$sat <- c(rep("VIIRS", nrow(VIIRSavg)), rep("MODIS", nrow(MODISavg)), rep("SeaWIF", nrow(SeaWiFSavg)))
Chla$sat <- as.factor(Chla$sat)
ggplot(data = Chla, aes(time, chla, colour = sat)) + geom_line(na.rm = TRUE) + theme_bw()


## ----plotlogChlaTS, fig.width = 8, fig.height = 4, fig.align = 'center'----
require(ggplot2)
logChla <- rbind(VIIRSlog, MODISlog, SeaWiFSlog)
logChla$sat <- c(rep("VIIRS", nrow(VIIRSlog)), rep("MODIS", nrow(MODISlog)), rep("SeaWIF",    nrow(SeaWiFSlog)))
logChla$sat <- as.factor(Chla$sat)
ggplot(data = logChla, aes(time, chla, colour = sat)) + geom_line(na.rm = TRUE)  + theme_bw()

## ----upCalc--------------------------------------------------------------
upwell <- function(ektrx, ektry, coast_angle){
   pi <- 3.1415927
   degtorad <- pi/180.
   alpha <- (360 - coast_angle) * degtorad
   s1 <- cos(alpha)
   t1 <- sin(alpha)
   s2 <- -1 * t1
   t2 <- s1
   perp <- s1 * ektrx + t1 * ektry
   para <- s2 * ektrx + t2 * ektry
return(perp/10)
}

## ----plotUpwellingFun----------------------------------------------------
plotUpwell <- function(upwelling, upDates){
require(ggplot2)
temp <- data.frame(upwelling = upwelling, time = upDates)
ggplot(temp, aes(time, upwelling)) + geom_line(na.rm = TRUE) + theme_bw()
}

## ----getUpw, eval = FALSE------------------------------------------------
#  require(xtractomatic)
#  xpos <- c(238, 238)
#  ypos <- c(37, 37)
#  tpos <- c("2005-01-01", "2005-12-31")
#  ektrx <- xtracto_3D("erdlasFnTran6ektrx", xpos, ypos, tpos = tpos)
#  ektry <- xtracto_3D("erdlasFnTran6ektry", xpos, ypos, tpos = tpos)
#  upwelling <- upwell(ektrx$data, ektry$data, 152)

## ----getUpw1, echo = FALSE, warning = FALSE------------------------------
require(xtractomatic)
xpos <- c(238, 238)
ypos <- c(37, 37)
tpos <- c("2005-01-01", "2005-12-31")
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     ektrx <- try(xtracto_3D("erdlasFnTran6ektrx", xpos, ypos, tpos = tpos), silent = TRUE)
     ektry <- try(xtracto_3D("erdlasFnTran6ektry", xpos, ypos, tpos = tpos), silent = TRUE)
     if ((!class(ektrx) == "try-error") & (!class(ektry) == "try-error")) {
       goodtry <- 1
       upwelling <- upwell(ektrx$data, ektry$data, 152)
     }
  }


## ----plotUpw1, fig.width = 7, fig.height = 4, fig.align = 'center', warning = FALSE----
plotUpwell(upwelling, as.Date(ektrx$time))

## ----plotUpw3, fig.width = 7, fig.height = 4, fig.align = 'center', warning = FALSE----
tempUpw <- upwelling
tempUpw[tempUpw < -500] <- NA
plotUpwell(tempUpw, as.Date(ektrx$time))

## ----plotUpw77, fig.width = 7, fig.height = 4, fig.align = 'center', warning = FALSE----
require(xtractomatic)
tpos <- c("1977-01-01", "1977-12-31")
ektrx77 <- xtracto_3D("erdlasFnTran6ektrx", xpos, ypos, tpos = tpos)
ektry77 <- xtracto_3D("erdlasFnTran6ektry", xpos, ypos, tpos = tpos)
upwelling77 <- upwell(ektrx77$data, ektry77$data, 152)
# remove the one big storm at the end
tempUpw <- upwelling77
tempUpw[tempUpw < -500] <- NA
plotUpwell(tempUpw, as.Date(ektrx77$time))

## ----plotUpw771, echo = FALSE, fig.width = 7, fig.height = 4, fig.align = 'center', warning = FALSE----
require(xtractomatic)
tpos <- c("1977-01-01", "1977-12-31")
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     ektrx77 <- try(xtracto_3D("erdlasFnTran6ektrx", xpos, ypos, tpos = tpos), silent = TRUE)
     ektry77 <- try(xtracto_3D("erdlasFnTran6ektry", xpos, ypos, tpos = tpos), silent = TRUE)
     if ((!class(ektrx77) == "try-error") & (!class(ektry77) == "try-error")) {
       goodtry <- 1
       upwelling77 <- upwell(ektrx77$data, ektry77$data, 152)
       # remove the one big storm at the end
       tempUpw <- upwelling77
       tempUpw[tempUpw < -500] <- NA
       plotUpwell(tempUpw, as.Date(ektrx77$time))
     }
  }


## ----getStress1, echo = FALSE, warning = FALSE---------------------------
require(xtractomatic)
xpos <- c(237, 237)
ypos <- c(36, 36)
tpos <- c("2009-10-04", "2009-11-19")
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     ascat <- try(xtracto_3D("erdQAstress3daytauy", xpos, ypos, tpos = tpos), silent = TRUE)
     quikscat <- try(xtracto_3D("erdQSstress3daytauy", xpos, ypos, tpos = tpos), silent = TRUE)
     if ((!class(ascat) == "try-error") & (!class(quikscat) == "try-error")) {
       goodtry <- 1
     }
  }


## ----getStress, eval = FALSE---------------------------------------------
#  require(xtractomatic)
#  xpos <- c(237, 237)
#  ypos <- c(36, 36)
#  tpos <- c("2009-10-04", "2009-11-19")
#  ascat <- xtracto_3D("erdQAstress3daytauy", xpos, ypos, tpos = tpos)
#  quikscat <- xtracto_3D("erdQSstress3daytauy", xpos, ypos, tpos = tpos)

## ----plotstress, fig.width = 6,  fig.height = 4, fig.align = 'center', warning = FALSE----
require(ggplot2)
ascatStress <- data.frame(stress = ascat$data, time = as.Date(ascat$time))
quikscatStress <- data.frame(stress = quikscat$data, time = as.Date(quikscat$time))
stressCompare <- rbind(ascatStress,quikscatStress)
stressCompare$sat <- c(rep("ascat", nrow(ascatStress)), rep("quikscat", nrow(quikscatStress)))
stressCompare$sat <- as.factor(stressCompare$sat)
ggplot(data = stressCompare, aes(time, stress, colour = sat)) + geom_line(na.rm = TRUE) + theme_bw()

## ----getPoes1, echo = FALSE, warning = FALSE-----------------------------
require(xtractomatic)
xpos <- c(235, 240)
ypos <- c(36, 39)
tpos <- c("last-5", "last")
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     poes <- try(xtracto_3D("agsstamday", xpos, ypos, tpos = tpos), silent = TRUE)
     if (!class(poes) == "try-error") {
       goodtry <- 1
     }
  }



## ----getPoes, eval = FALSE-----------------------------------------------
#  require(xtractomatic)
#  xpos <- c(235, 240)
#  ypos <- c(36, 39)
#  tpos <- c("last-5", "last")
#  poes <- xtracto_3D("agsstamday", xpos, ypos, tpos = tpos)
#  

## ----plotPoes, fig.width = 7.5, fig.height = 4, fig.align = 'center'-----
require(ggplot2)
require(reshape2)
require(mapdata)

melt_sst <- function(longitude,latitude,mTime,sst) {
  dimnames(sst) <- list(long = longitude, lat = latitude)
  ret <- melt(sst, value.name = "sst")
  cbind(date = mTime, ret)
}
xpos <- xpos - 360
longitude <- poes$longitude - 360
latitude <- poes$latitude
imon <- 1:5
tmp <- lapply(imon, function(x) melt_sst(longitude, latitude, poes$time[x], poes$data[,,x]))
allmons <- do.call(rbind, tmp)
my.col <- colors$thermal
w <- map_data("worldHires", ylim = ypos, xlim = xpos)
ggplot(data = allmons, aes(x = long, y = lat, fill = sst)) + 
    geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") +
    geom_raster(interpolate = TRUE) +
    scale_fill_gradientn(colours = my.col, na.value = NA) +
    theme_bw() +
    coord_fixed(1.3,xlim = xpos, ylim = ypos) + 
    facet_wrap(~ date, nrow = 2)


## ----getCatalina---------------------------------------------------------

require(reshape2)

allyears <- NULL
xpos <- c(238, 243)
ypos <- c(30, 35)
for (year in 2009:2014) {
  tpos <- rep(paste(year, '-12-20', sep = ""), 2)
  tmp <- xtracto_3D('jplMURSST41SST', xpos, ypos, tpos = tpos)
#ggplot is sensitve that the grid is absolutely regular
  tmp$latitude <- seq(range(tmp$latitude)[1], range(tmp$latitude)[2], length.out = length(tmp$latitude))
  tmp$longitude <- seq(range(tmp$longitude)[1], range(tmp$longitude)[2], length.out = length(tmp$longitude))  
  dimnames(tmp$data) <- list(long = tmp$longitude, lat = tmp$latitude) 
  ret <- melt(tmp$data, value.name = "sst")
  ret <- cbind(date = tmp$time, ret)
  allyears <- rbind(allyears, ret)
}
allyears$long <- allyears$long - 360 

## ----plotCatalina, fig.width = 7.5, fig.height = 4, fig.align = 'center'----
require(ggplot2)
require(mapdata)
xpos <- xpos - 360
#long<-allyears$longitude-360
#lat<-allyears$latitude
coast <- map_data("worldHires", ylim = ypos, xlim = c(-123.5, -120.))
my.col <- colors$thermal

ggplot(data = allyears, aes(x = long, y = lat, fill = sst)) + 
  geom_polygon(data = coast, aes(x = long, y = lat, group = group), fill = "grey80") +
  geom_raster(interpolate = TRUE) +
  scale_fill_gradientn(colours = my.col, na.value = NA) +
  theme_bw() +
  coord_fixed(1.3, xlim = xpos, ylim = ypos) + 
  facet_wrap(~date, nrow = 2)


## ----mbnms---------------------------------------------------------------
require(xtractomatic)
str(mbnms)

## ----mbnmsChla, eval = FALSE---------------------------------------------
#  require(xtractomatic)
#  tpos <- c("2014-09-01", "2014-10-01")
#  xpos <- mbnms$Longitude
#  ypos <- mbnms$Latitude
#  sanctchl <- xtractogon('erdVH3chlamday', xpos, ypos, tpos = tpos )
#  str(sanctchl)

## ----mbnmsChla1, echo = FALSE, warning = FALSE---------------------------
require(xtractomatic)
tpos <- c("2014-09-01", "2014-10-01")
#tpos <-as.Date(tpos)
xpos <- mbnms$Longitude
ypos <- mbnms$Latitude
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     sanctchl <- try(xtractogon('erdVH3chlamday', xpos, ypos, tpos = tpos), silent = TRUE)
     if (!class(sanctchl) == "try-error") {
       goodtry <- 1
       str(sanctchl)
     }
  }


## ----mbnmsChlaPlot, fig.width = 5, fig.height = 5, fig.align = 'center'----
require(ggplot2)
require(mapdata)
xlim <- c(-123.5, -121.)
ylim <- c(35, 38)
mbnmsFrame <- mapFrame(sanctchl$longitude + 360, sanctchl$latitude, log(sanctchl$data[, , 2]))
my.col <- colors$algae
w <- map_data("worldHires", ylim = ylim, xlim = xlim)
myplot <- ggplot() + geom_path(data = mbnms, aes(x = Longitude, y = Latitude), colour = "black")   
myplot <- myplot + 
    geom_raster(data = mbnmsFrame, aes(x = x, y = y, fill = chla), interpolate = FALSE) + 
    geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") +
    theme_bw() + scale_fill_gradientn(colours = my.col, na.value = NA, limits = c(-2, 4.5)) +
    ylab("latitude") + xlab("longitude") +
    coord_fixed(1.3, xlim = xlim, ylim = ylim) + 
    ggtitle(paste("log(Chla) in MBNMS", sanctchl$time[2]))
myplot

## ----mbnmsBathy, eval = FALSE--------------------------------------------
#  require(xtractomatic)
#  tpos <- c("2014-09-01", "2014-10-01")
#  #tpos <-as.Date(tpos)
#  xpos <- mbnms$Longitude
#  ypos <- mbnms$Latitude
#  bathy <- xtractogon('ETOPO180', xpos, ypos)
#  str(bathy)

## ----mbnmsBathy1, echo = FALSE, warning = FALSE, error = TRUE------------
require(xtractomatic)
tpos <- c("2014-10-01", "2014-10-01")
xpos <- xtractomatic::mbnms$Longitude
ypos <-  xtractomatic::mbnms$Latitude
numtries <- 5
tryn <- 0
goodtry <- -1
options(warn = 2)
while ((tryn <= numtries) & (goodtry == -1)) {
     tryn <- tryn + 1
     bathy <- try(xtractogon('ETOPO180', xpos, ypos), silent = TRUE)
     if (!class(bathy) == "try-error") {
       goodtry <- 1
       str(bathy)
     }
  }


## ----mbnmsBathyPlot, fig.width = 5, fig.height = 5, fig.align = 'center'----
require(ggplot2)
require(mapdata)
xlim <- c(-123.5, -121.)
ylim <- c(35, 38)
mbnmsFrame <- mapFrame(bathy$longitude + 360, bathy$latitude, bathy$data[, , 1])
w <- map_data("worldHires", ylim = ylim, xlim = xlim)
myplot <- ggplot() + geom_path(data = mbnms,aes(x = Longitude, y = Latitude), colour = "black")   
myplot <- myplot + geom_raster(data = mbnmsFrame, aes(x = x, y = y, fill = chla),interpolate = FALSE, na.rm = TRUE) +
    geom_polygon(data = w, aes(x = long, y = lat, group = group), fill = "grey80") +
    theme_bw() + scale_fill_gradient(na.value = NA, name = "Depth") +
    ylab("latitude") + xlab("longitude") +
    coord_fixed(1.3, xlim = xlim, ylim = ylim) + ggtitle("MBNMS Bathymetry")
myplot

## ----nearGrid,eval=FALSE-------------------------------------------------
#  latitude[which.min(abs(latitude - ypos[1]))]  # minimum latitude
#  latitude[which.min(abs(latitude - ypos[2]))]  # maximum latitude
#  longitude[which.min(abs(longitude- xpos[1]))] # minimum longitude
#  longitude[which.min(abs(longitude - xpos[2]))] # maximum longitude
#  isotime[which.min(abs(time- tpos[1]))] # minimum time
#  isotime[which.min(abs(time - tpos[2]))] # maximum time

## ----timespacing---------------------------------------------------------
getInfo('mhchla8day') 
getInfo('mbchla8day') 

## ----searchData----------------------------------------------------------
mylist <- list('varname:chl', 'datasetname:mday')
searchResult <- searchData(mylist)

## ------------------------------------------------------------------------
require("DT")
DT::datatable(searchResult)

## ----searchData2, eval = FALSE-------------------------------------------
#  mylist <- list('varname:chl')
#  searchResult <- searchData(mylist)

## ----erddapStruct--------------------------------------------------------
cat(paste0(xtractomatic:::erddapStruct["datasetname", 1:5],': ' , xtractomatic:::erddapStruct["longname", 1:5],"\n"))

