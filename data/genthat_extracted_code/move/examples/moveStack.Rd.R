library(move)


### Name: moveStack
### Title: Creating a MoveStack
### Aliases: moveStack moveStack,list-method moveStack,Move-method
###   moveStack,MoveStack-method

### ** Examples

data(leroy)
data(ricky)

## creating a moveStack from a list of move objects
l <- list(ricky[200:270,], leroy[200:270,])
moveStack(l)

## creating a moveStack from several move objects
moveStack(ricky[200:270,], leroy[200:270,], forceTz="UTC")

## creating a moveStack with the same time zone as input move objects
moveStack(ricky[200:270,], leroy[200:270,], forceTz=attr(ricky@timestamps,"tzone"))

## Don't show: 
data <- read.csv(system.file("extdata","leroy.csv.gz",package="move"))[100:199,]
ricky2 <- move(x=data$location.long, y=data$location.lat, time=as.POSIXct(data$timestamp,format="%Y-%m-%d %H:%M:%OS", tz="UTC"), proj=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84"), data=data, animal=paste0(data$individual.local.identifier,"a"), sensor=data$sensor)
list <- list(leroy, ricky2)
stack <- moveStack(list)
## End(Don't show)



