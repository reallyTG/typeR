library(surveillance)


### Name: imdepi
### Title: Occurrence of Invasive Meningococcal Disease in Germany
### Aliases: imdepi
### Keywords: datasets

### ** Examples

data("imdepi")

# Basic information
print(imdepi, n=5, digits=2)

# What is an epidataCS-object?
str(imdepi, max.level=4)
names(imdepi$events@data)
# => events data.frame has hidden columns
sapply(imdepi$events@data, class)
# marks and print methods ignore these auxiliary columns

# look at the B type only
imdepiB <- subset(imdepi, type == "B")
#<- subsetting applies to the 'events' component
imdepiB

# select only the last 10 events
tail(imdepi, n=10)   # there is also a corresponding 'head' method

# Access event marks
str(marks(imdepi))

# there is an update-method which assures that the object remains valid
# when changing parameters like eps.s, eps.t or qmatrix
update(imdepi, eps.t = 20)

# Summary
s <- summary(imdepi)
s
str(s)

# Step function of number of infectives
plot(s$counter, xlab = "Time [days]",
     ylab = "Number of infectious individuals",
     main = "Time series of IMD assuming 30 days infectious period")

# distribution of number of potential sources of infection
opar <- par(mfrow=c(1,2), las=1)
for (type in c("B","C")) {
  plot(100*prop.table(table(s$nSources[s$eventTypes==type])),
  xlim=range(s$nSources), xlab = "Number of potential epidemic sources",
  ylab = "Proportion of events [%]")
}
par(opar)

# a histogram of the number of events along time (using the
# plot-method for the epidataCS-class, see ?plot.epidataCS)
opar <- par(mfrow = c(2,1))
plot(imdepi, "time", subset = type == "B", main = "Finetype B")
plot(imdepi, "time", subset = type == "C", main = "Finetype C")
par(opar)

# Plot the spatial distribution of the events in W
plot(imdepi, "space", points.args = list(col=c("indianred", "darkblue")),
     axes = TRUE, lwd = 2)
title(xlab = "x [km]", ylab = "y [km]")

## Not run: 
##D # or manually (no legends, no account for tied locations)
##D plot(imdepi$W, lwd=2)
##D plot(imdepi$events, pch=c(3,4)[imdepi$events$type], cex=0.8,
##D      col=c("indianred", "darkblue")[imdepi$events$type], add=TRUE)
## End(Not run)

## Not run: 
##D   # Show a dynamic illustration of the spatio-temporal dynamics of the 
##D   # spread during the first year of type B with a step size of 7 days
##D   animate(imdepiB, interval=c(0,365), time.spacing=7, sleep=0.1)
## End(Not run)



