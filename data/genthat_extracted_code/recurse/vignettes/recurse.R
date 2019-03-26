## ---- results='hide', message=FALSE, warning=FALSE-----------------------
require(recurse)
require(scales)
require(sp)

## ---- fig.width=6, fig.height=6------------------------------------------
data(martin)
plot(martin$x, martin$y, col = viridis_pal()(nrow(martin)), pch = 20, 
	 xlab = "x", ylab = "y", asp = 1)


## ---- echo=FALSE, fig.width=4, fig.height=4------------------------------
steps = sqrt(diff(martin$x)^2 + diff(martin$y)^2)
hist(steps, xlab = "Step length", main = "")

## ---- fig.width=7, fig.height=3.5, fig.show='hold'-----------------------
martinvisit = getRecursions(martin, 2) 

par(mfrow = c(1, 2), mar = c(4, 4, 1, 1))
plot(martinvisit, martin, legendPos = c(13, -10))
drawCircle(-15, -10, 2)

hist(martinvisit$revisits, breaks = 20, main = "", xlab = "Revisits (radius = 2)")
summary(martinvisit$revisits)

## ------------------------------------------------------------------------
head(martinvisit$revisitStats)

## ---- echo=FALSE, fig.width=7, fig.height=4------------------------------
boxplot(martinvisit$revisitStats$timeInside ~ as.numeric(format(martinvisit$revisitStats$entranceTime, "%H")),
		xlab = "Entrance time", ylab = "Visit duration (h)")


## ---- echo=FALSE, fig.width=7, fig.height=3.5----------------------------
par(mfrow = c(1, 2), mar = c(4, 4, 1, 1))
hist(martinvisit$revisitStats$timeSinceLastVisit,
		xlab = "Time since last visit (h)", main = "")

plot(martinvisit$revisitStats$timeSinceLastVisit, martinvisit$revisitStats$timeInside,
	 xlab = "Time since last visit (h)", ylab = "Time inside (h)")
lines(lowess(x = martinvisit$revisitStats$timeSinceLastVisit, y = martinvisit$revisitStats$timeInside, delta = 0.01 * diff(range(martinvisit$revisitStats$timeSinceLastVisit, na.rm = TRUE))), col = "red")

## ---- fig.width=5, fig.height=5------------------------------------------
data(wren)
animals = rbind(martin, wren)
plot(animals$x, animals$y, col = c("red", "darkblue")[as.numeric(animals$id)], 
	 pch = ".", xlab = "x", ylab = "y", asp = 1)


## ---- fig.width=5, fig.height=5, fig.show='hold'-------------------------
popvisit = getRecursions(animals, 2) 

head(popvisit$revisitStats)

plot(popvisit, animals, legendPos = c(15, -10))

## ------------------------------------------------------------------------

locations = data.frame(x = c(0, 10, 20), y = c(0, 10, 10))
locvisit = getRecursionsAtLocations(wren, locations, 2) 

locvisit$revisits

## ---- fig.width=5, fig.height=5------------------------------------------
visitThreshold = quantile(popvisit$revisits, 0.8)
popCluster = kmeans(animals[popvisit$revisits > visitThreshold,c("x", "y")], centers = 3)

plot(animals$x, animals$y, col = c("red", "darkblue")[as.numeric(animals$id)], 
	 pch = ".", xlab = "x", ylab = "y", asp = 1)
with(animals[popvisit$revisits > visitThreshold,],
	points(x, y, col = c(alpha("red", 0.5), alpha("darkblue", 0.5))[as.numeric(id)], 
		   pch = c(15:17)[popCluster$cluster]) )
legend("topleft", pch = 15:17, legend = paste("cluster", 1:3), bty = "n")

## ---- echo=FALSE, fig.width=5, fig.height=5------------------------------
protectedArea = sp::SpatialPolygons( list(
		   	    	 	sp::Polygons( list(sp::Polygon(cbind(c(4,10,9,3.5,4),c(11,9,13,13.5,11)))), ID = 1 )
		    	 	 	))
plot(martin$x, martin$y, type = "l", pch = 20, 
	 xlab = "x", ylab = "y", asp = 1)
plot(protectedArea, add = TRUE, border = "red", lwd = 2)

## ------------------------------------------------------------------------
getRecursionsInPolygon(martin, protectedArea)

## ------------------------------------------------------------------------
breaks = martin$t[c(1, nrow(martin)/2, nrow(martin))]
beforeAfterResTime = calculateIntervalResidenceTime(martinvisit, breaks = breaks, 
													labels = c("before", "after"))

head(beforeAfterResTime)
tail(beforeAfterResTime)

## ---- echo=FALSE, fig.width=4, fig.height=4------------------------------
plot(x = (1:20), y = pi * (1:20)^2, type = "l", xlab = "radius", ylab = "area")

## ---- echo=FALSE, fig.width=5, fig.height=5------------------------------
radii = seq(from = 0.5, to = 20, by = 0.25)
visits = NULL

for (i in 1:length(radii))
{
	visits[[i]] = getRecursions(martin, radius = radii[i])
}

plot(x = radii, y = lapply(visits, function(x) mean(x$revisits)), pch = 16, xlab = "radius", ylab = "mean revisits")


## ---- echo=FALSE, fig.width=7, fig.height=2.5----------------------------
radii = radii[1:which(radii == 9.5)]
visits = visits[1:length(radii)]

par(mfrow = c(1, 3), mar = c(4, 4, 1, 1))
plot(x = radii, y = lapply(visits, function(x) mean(x$revisits)), pch = 16, xlab = "radius", ylab = "mean(revisits)")
plot(x = radii, y = lapply(visits, function(x) var(log(x$revisits))), pch = 16, xlab = "radius", ylab = "var(log((revisits))")
plot(x = radii, y = lapply(visits, function(x) max(x$revisits)), pch = 16, xlab = "radius", ylab = "max(revisits)")


## ---- echo=FALSE, fig.width=7, fig.height=7------------------------------
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1))

r = c(0.5, 1.5, 4, 6)

for (rad in r)
{
	plot(visits[[which(radii == rad)]], martin, main = paste("Radius", rad), legendPos = c(12, -12))
	drawCircle(-11, -12, rad)
}


## ---- fig.width=7, fig.height=7, fig.show='hold'-------------------------
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

nLocs = c(600, 500, 400, 300)
martin.radomgap = NULL
martinvisit.randomgap = NULL

for (i in 1:length(nLocs))
{
	martin.radomgap[[i]] = martin[sort(sample(1:600, nLocs[i], replace = FALSE)),]
	martinvisit.randomgap[[i]] = getRecursions(martin.radomgap[[i]], radius = 2)
	
	print(paste(nLocs[i], "locations, mean revisits:", mean(martinvisit.randomgap[[i]]$revisits)))
	plot(martinvisit.randomgap[[i]], martin.radomgap[[i]], 
		 main =  paste(nLocs[i], "locations"), legendPos = c(12, -10))
}

## ---- fig.width=7, fig.height=7, fig.show='hold'-------------------------
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

nLocs = c(600, 500, 400, 300)
martin.biasgap = NULL
martinvisit.biasgap = NULL

xyVal = order(1:600, -3 * martin$x + martin$y + rnorm(600, 0, 5), decreasing = TRUE)

for (i in 1:length(nLocs))
{
	martin.biasgap[[i]] = martin[sort(xyVal[1:nLocs[i]]),]
	martinvisit.biasgap[[i]] = getRecursions(martin.biasgap[[i]], radius = 2)
	
	print(paste(nLocs[i], "locations, mean revisits:", mean(martinvisit.biasgap[[i]]$revisits)))
	plot(martinvisit.biasgap[[i]], martin.biasgap[[i]], 
		 main =  paste(nLocs[i], "locations"), legendPos = c(12, -10))
}

