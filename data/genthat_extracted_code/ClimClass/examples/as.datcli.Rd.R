library(ClimClass)


### Name: as.datcli
### Title: as.datcli
### Aliases: as.datcli

### ** Examples


### Not Run!! 
# Install 'climatol' from 'http://www.climatol.eu/' first
### Then load the package, uncomment and run the following line
# library(climatol)
	library(stringr)
 data(Trent_climate)

 TrentinoClimateDf <- do.call(rbind,clima_81_10)
 names <- rownames(TrentinoClimateDf)
 TrentinoClimateDf$station <- 
 unlist(lapply(X=str_split(names,pattern="[.]"),FUN=function(x) {x[1]}))
 

 station <- "T0129"
datcli <- as.datcli(TrentinoClimateDf,station=station)

### Not Run!! 
# Install 'climatol' from 'http://www.climatol.eu/' first
### Then load the package, uncomment and run the following line
# diagwl(datcli,est=station,alt=100,per="Period",mlab="en") ## plots a Walter-Lieth's climograph




