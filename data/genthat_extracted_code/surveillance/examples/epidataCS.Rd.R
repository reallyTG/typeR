library(surveillance)


### Name: epidataCS
### Title: Continuous Space-Time Marked Point Patterns with Grid-Based
###   Covariates
### Aliases: epidataCS as.epidataCS print.epidataCS nobs.epidataCS
###   head.epidataCS tail.epidataCS [.epidataCS subset.epidataCS
###   marks.epidataCS summary.epidataCS print.summary.epidataCS
###   as.stepfun.epidataCS getSourceDists
###   coerce,epidataCS,SpatialPointsDataFrame-method
### Keywords: spatial classes manip

### ** Examples

## load "imdepi" example data (which is an object of class "epidataCS")
data("imdepi")

## print and summary
print(imdepi, n=5, digits=2)
print(s <- summary(imdepi))
plot(s$counter,  # same as 'as.stepfun(imdepi)'
     xlab = "Time [days]", ylab="Number of infectious individuals",
     main=paste("Time course of the number of infectious individuals",
                "assuming an infectious period of 30 days", sep="\n"))
plot(table(s$nSources), xlab="Number of \"close\" infective individuals",
     ylab="Number of events",
     main=paste("Distribution of the number of potential sources",
                "assuming an interaction range of 200 km and 30 days",
                sep="\n"))
## the summary object contains further information
str(s)

## a histogram of the spatial distances to potential source events
## (i.e., to events of the previous eps.t=30 days within eps.s=200 km)
sourceDists_space <- getSourceDists(imdepi, "space")
hist(sourceDists_space); rug(sourceDists_space)

## internal structure of an "epidataCS"-object
str(imdepi, max.level=4)
## see help("imdepi") for more info on the data set

## extraction methods subset the 'events' component
## (thereby taking care of the validity of the epidataCS object,
## for instance the hidden auxiliary column .sources)
imdepi[101:200,]
tail(imdepi, n=4)           # reduce the epidemic to the last 4 events
subset(imdepi, type=="B")   # only consider event type B

## see help("plot.epidataCS") for convenient plot-methods for "epidataCS"


###
### reconstruct the "imdepi" object
###

## observation region
load(system.file("shapes", "districtsD.RData", package="surveillance"),
     verbose = TRUE)
summary(stateD)

## extract point pattern of events from the "imdepi" data
data(imdepi)
events <- marks(imdepi)  # data frame with coordinate columns
coordinates(events) <- c("x", "y")  # promote to a "SpatialPointsDataFrame"
#proj4string(events) <- proj4string(stateD)
events@proj4string <- stateD@proj4string  # exact copy (avoid CRS reformatting)

## or, much simpler, use the corresponding coerce-method
## Don't show: 
events@coords.nrs <- numeric(0L)
stopifnot(all.equal(as(imdepi, "SpatialPointsDataFrame"), events))
## End(Don't show)
events <- as(imdepi, "SpatialPointsDataFrame")
summary(events)

## plot observation region with events
plot(stateD, axes=TRUE); title(xlab="x [km]", ylab="y [km]")
points(events, pch=unclass(events$type), cex=0.5, col=unclass(events$type))
legend("topright", legend=levels(events$type), title="Type", pch=1:2, col=1:2)

## space-time grid with endemic covariates
head(stgrid <- imdepi$stgrid[,-1])

## reconstruct the "imdepi" object from its components
myimdepi <- as.epidataCS(events = events, stgrid = stgrid,
                         W = stateD, qmatrix = diag(2), nCircle2Poly = 16)
## Not run: 
##D ## This reconstructed object is equal to 'imdepi' as long as the internal
##D ## structures of the embedded classes ("owin", "SpatialPolygons", ...), and
##D ## the calculation of the influence regions by "polyclip" have not changed:
##D stopifnot(all.equal(imdepi, myimdepi))
## End(Not run)



