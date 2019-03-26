library(move)


### Name: move
### Title: Create a Move object
### Aliases: move move,character,missing,missing,missing,missing-method
###   move,connection,missing,missing,missing,missing-method
###   move,ltraj,missing,missing,missing,missing-method
###   move,numeric,numeric,POSIXct,data.frame,character-method
###   move,numeric,numeric,POSIXct,data.frame,CRS-method
###   move,numeric,numeric,POSIXct,data.frame,missing-method
###   move,numeric,numeric,POSIXct,missing,ANY-method

### ** Examples

## create a move object from a Movebank csv file
filePath<-system.file("extdata","leroy.csv.gz",package="move")
data <- move(filePath)

## create a move object from non-Movebank data
file <- read.table(filePath, header=TRUE, sep=",", dec=".")
data <- move(x=file$location.long, y=file$location.lat, 
	     time=as.POSIXct(file$timestamp, format="%Y-%m-%d %H:%M:%S", tz="UTC"), 
	     data=file, proj=CRS("+proj=longlat +ellps=WGS84"), 
	     animal="Leroy", sensor="GPS")
plot(data, type="b", pch=20)

## if the data contain multiple individuals a moveStack will be created
fishersPath<-system.file("extdata","fishersSubset.csv.gz",package="move")
fishersSubset <- read.table(fishersPath, header=TRUE, sep=",", dec=".")
data2 <- move(x=fishersSubset$location.long, y=fishersSubset$location.lat, 
             time=as.POSIXct(fishersSubset$timestamp,format="%Y-%m-%d %H:%M:%S", tz="UTC"), 
             data=fishersSubset, proj=CRS("+proj=longlat +ellps=WGS84"),
             animal=fishersSubset$individual.local.identifier,
             sensor=fishersSubset$sensor)
plot(data2, type="b", pch=20, col=c("green","blue")[data2@idData$individual.local.identifier])
plot(data2[[2]], type="l")

## Don't show: 
move(x=1:10,y=1:10,time=as.POSIXct(1:10, origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'))
move(x=1:10,y=1:10,time=as.POSIXct(c(1:5,1:5), origin='1970-1-1'),proj=CRS('+proj=longlat +ellps=WGS84'), animal=c(rep('a',5),rep('b',5)))
## End(Don't show)



