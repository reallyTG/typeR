library(berryFunctions)


### Name: climateGraph
### Title: climate graph after Walter and Lieth
### Aliases: climateGraph
### Keywords: hplot

### ** Examples


temp <- c(-9.3,-8.2,-2.8,6.3,13.4,16.8,18.4,17,11.7,5.6,-1,-5.9)#
rain <- c(46,46,36,30,31,21,26,57,76,85,59,46)

climateGraph(temp, rain)
climateGraph(temp, rain, textprop=0.6)
climateGraph(temp, rain, mar=c(2,3,4,3), textprop=0) # no table written to the right
# vertical lines instead of filled polygon:
climateGraph(temp, rain, arghumi=list(density=15, angle=90))
# fill color for arid without transparency:
climateGraph(temp, rain, argarid=list(col="gold"))
# for the Americans - axes should be different, though!:
climateGraph(temp, rain, units=c("\U{00B0}F","in"))

rain2 <- c(23, 11, 4, 2, 10, 53, 40, 15, 21, 25, 29, 22)
# fix ylim if you want to compare diagrams of different stations:
climateGraph(temp, rain2, ylim=c(-15, 50)) # works with two arid phases as well

op <- par(mfrow=c(2,1)) # mulipanel plot
climateGraph(temp, rain, argtext=list(cex=0.7))
climateGraph(temp, rain2, argtext=list(cex=0.7))
par(op)

rain <- c(54, 23, 5, 2, 5, 70, 181, 345, 265, 145, 105, 80) # with extrema
climateGraph(temp, rain) # August can be visually compared to June
climateGraph(temp, rain, compress=TRUE)
# compressing extrema enables a better view of the temperature,
# but heigths of rain cannot be visually compared anymore
climateGraph(temp, rain, compress=TRUE, ylim=c(-10, 90))
# needs ylim in linearly continued temp units
climateGraph(temp, rain, compress=TRUE, argcomp=list(density=30, col=6))

## Not run: 
##D pdf("ClimateGraph.pdf")
##D climateGraph(temp, rain, main="Another Station\nlocated somewhere else")
##D dev.off()
##D openFile(ClimateGraph.pdf")
##D unlink("ClimateGraph.pdf")
##D 
##D # further German reading:
##D browseURL("http://www.klimadiagramme.de/all.html")
##D 
##D 
##D # Climate Graphs for the USA:
##D NOOAlink <- "http://www1.ncdc.noaa.gov/pub/data/normals/1981-2010/"
##D browseURL(NOOAlink)
##D # Find your Station here:
##D browseURL(paste0(NOOAlink,"/station-inventories/allstations.txt"))
##D 
##D # Data from Roseburg, Oregon:
##D download.file(destfile="Roseburg.txt", url=paste0("http://www1.ncdc.noaa.gov/",
##D           "pub/data/normals/1981-2010/products/station/USC00357331.normals.txt"))
##D RT <- read.table(file="Roseburg.txt", skip=11, nrows=1, as.is=TRUE)[1,-1]
##D RT <- ( as.numeric(substr(RT,1,3))/10   - 32) * 5/9     # converted to degrees C
##D RP <- read.table(file="Roseburg.txt", skip=580, nrows=1, as.is=TRUE)[1,-1]
##D RP <-  as.numeric(substr(RP,1,nchar(RP)-1))/100*25.4
##D meta <- read.table(file="Roseburg.txt", nrows=5, as.is=TRUE, sep=":")
##D meta <- paste(meta[1,2], paste(meta[3:4 ,2], collapse=" /"), meta[5,2], sep="\n")
##D unlink("Roseburg.txt")
##D 
##D climateGraph(RT, RP, main=meta)
##D climateGraph(RT, RP, main=meta, compress=TRUE)
##D 
##D 
##D # Climate Graphs for Germany:
##D browseURL("https://github.com/brry/rdwd#rdwd")
##D instGit("brry/rdwd")
##D link <- rdwd::selectDWD("Potsdam", res="monthly", var="kl", per="h")
##D clim <- rdwd::dataDWD(link, dir=tempdir())
##D dates <- strptime(clim$MESS_DATUM_BEGINN, "%Y%m%d")
##D temp <- tapply(clim$LUFTTEMPERATUR, INDEX=format(dates, "%m"), FUN=mean, na.rm=FALSE)
##D precsums <- tapply(clim$NIEDERSCHLAGSHOEHE, INDEX=format(dates, "%Y-%m"), FUN=sum)
##D eachmonth <- format(strptime(paste(names(precsums),"01"), "%Y-%m %d"),"%m")
##D prec <- tapply(precsums, eachmonth, FUN=mean)
##D meta <- paste("Potsdam\n", paste(range(dates, na.rm=TRUE), collapse=" to "), "\n", sep="")
##D 
##D climateGraph(temp, prec, main=meta, ylim=c(-2, 45))
##D # Add Quartiles (as in boxplots): numerically sorted, 50% of the data lie inbetween
##D TQ <- tapply(clim$LUFTTEMPERATUR, INDEX=format(dates, "%m"), FUN=quantile)
##D TQ <- sapply(TQ, I)
##D arrows(x0=1:12, y0=TQ["25%",], y1=TQ["75%",], angle=90, code=3, col=2, len=0.1)
##D #
##D PQ <- tapply(precsums, eachmonth, FUN=quantile)
##D PQ <- sapply(PQ, I)
##D arrows(x0=1:12, y0=PQ["25%",]/2, y1=PQ["75%",]/2, angle=90, code=3, col=4, len=0, lwd=3, lend=1)
##D mtext("IQR shown als lines", col=8, at=6.5, line=0.7, cex=1.2, font=2)
##D 
##D 
##D # Comparison to diagram in climatol
##D install.packages("climatol")
##D help(package="climatol")
##D library(climatol)
##D data(datcli)
##D diagwl(datcli,est="Example station",alt=100,per="1961-90",mlab="en")
##D 
## End(Not run)




