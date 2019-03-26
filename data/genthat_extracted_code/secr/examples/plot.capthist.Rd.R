library(secr)


### Name: plot.capthist
### Title: Plot Detection Histories
### Aliases: plot.capthist plotMCP
### Keywords: hplot

### ** Examples

demotrap <- make.grid()
tempcapt <- sim.capthist(demotrap, 
    popn = list(D = 5, buffer = 50), 
    detectpar = list(g0 = 0.15, sigma = 30))
plot(tempcapt, border = 10, rad = 3, tracks = TRUE, 
    lab1cap = TRUE, laboffset = 2.5)

## type = n.per.cluster

## generate some captures
testregion <- data.frame(x = c(0,2000,2000,0),
    y = c(0,0,2000,2000))
popn <- sim.popn (D = 10, core = testregion, buffer = 0,
    model2D = "hills", details = list(hills = c(-2,3)))
t1 <- make.grid(nx = 1, ny = 1)
t1.100 <- make.systematic (cluster = t1, spacing = 100,
    region = testregion)
capt <- sim.capthist(t1.100, popn = popn, noccasions = 1)

## now plot captures ...
temp <- plot(capt, title = "Individuals per cluster",
    type = "n.per.cluster", hidetraps = FALSE,
    gridlines = FALSE, cappar = list(cex = 1.5))

## Not run: 
##D ## add legend; click on map to place top left corner
##D legend (locator(1), pch = 21, pt.bg = temp$colour,
##D     pt.cex = 1.3, legend = temp$legend, cex = 0.8)
## End(Not run)

## Not run: 
##D ## try varying individual colours - requires RColorBrewer
##D library(RColorBrewer)
##D plot(infraCH[[2]], icolours = brewer.pal(12, "Set3"), tracks = T,
##D     bg = "black", cappar = list(cex = 2), border = 10, rad = 2,
##D     gridlines=F)
## End(Not run)

## Not run: 
##D ## generate telemetry data
##D te <- make.telemetry()
##D tr <- make.grid(detector = "proximity")
##D totalpop <- sim.popn(tr, D = 20, buffer = 100)
##D tepop <- subset(totalpop, runif(nrow(totalpop)) < 0.05)
##D teCH <- sim.capthist(te, popn = tepop, renumber=FALSE, detectfn = "HHN",
##D     detectpar = list(lambda0 = 3, sigma = 25))
##D plot(teCH, type = 'telemetry', tracks = TRUE)
##D 
##D ## simple "centres" example
##D CH <- sim.capthist(make.poly(), nocc = 20, detectpar = list(g0 = 1, sigma = 10))
##D plot(CH, cappar = list(col = 'orange'), varycol = FALSE, border = 10)
##D plot(CH, type = 'centres', add = TRUE, rad = 0)
## End(Not run)



