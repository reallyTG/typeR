library(secr)


### Name: trap.builder
### Title: Complex Detector Layouts
### Aliases: trap.builder mash cluster.counts cluster.centres
### Keywords: manip

### ** Examples


## solitary detectors placed randomly within a rectangle
tempgrid <- trap.builder (n = 10, method = "SRS",
    region = cbind(x = c(0,1000,1000,0),
    y = c(0,0,1000,1000)), plt = TRUE)

## GRTS sample of mini-grids within a rectangle
## GRTS requires package 'spsurvey' that may be unavailable
##  on Mavericks
## edgemethod = "allinside" avoids truncation at edge
minigrid <- make.grid(nx = 3, ny = 3, spacing = 50,
    detector = "proximity")
    
if (requireNamespace('spsurvey')) {
  tempgrid <- trap.builder (n = 20, cluster = minigrid,
    method = "GRTS", edgemethod = "allinside", region =
    cbind(x = c(0,6000,6000,0), y = c(0,0,6000,6000)),
    plt = TRUE)
}
## as before, but excluding detectors from a polygon
if (requireNamespace('spsurvey')) {
  tempgrid <- trap.builder (n = 40, cluster = minigrid,
    method = "GRTS", edgemethod = "allinside", region =
    cbind(x = c(0,6000,6000,0), y = c(0,0,6000,6000)),
    exclude = cbind(x = c(3000,7000,7000,3000), y =
    c(2000,2000,4000,4000)), exclmethod = "alloutside",
    plt = TRUE)
}

## one detector in each 100-m grid cell -
## a form of stratified simple random sample
origins <- expand.grid(x = seq(0, 900, 100),
    y = seq(0, 1100, 100))
XY <- origins + runif(10 * 12 * 2) * 100
temp <- trap.builder (frame = XY, method = "all",
    detector = "multi")
## same as temp <- read.traps(data = XY)
plot(temp, border = 0)  ## default grid is 100 m

## simulate some data
## regular lattice of mini-arrays
minigrid <- make.grid(nx = 3, ny = 3, spacing = 50,
    detector = "proximity")
tempgrid <- trap.builder (cluster = minigrid , method =
    "all", frame = expand.grid(x = seq(1000, 5000, 2000),
    y = seq(1000, 5000, 2000)), plt = TRUE)
tempcapt <- sim.capthist(tempgrid, popn = list(D = 10))
cluster.counts(tempcapt)
cluster.centres(tempgrid)

## "mash" the CH
summary(mash(tempcapt))

## compare timings (estimates are near identical)
## Not run: 
##D tempmask1 <- make.mask(tempgrid, type = "clusterrect",
##D     buffer = 200, spacing = 10)
##D fit1 <- secr.fit(tempcapt, mask = tempmask1, trace = FALSE)         ## 680 s
##D 
##D tempmask2 <- make.mask(minigrid, spacing = 10)
##D fit2 <- secr.fit(mash(tempcapt), mask = tempmask2, trace = FALSE)   ## 6.2 s
##D ## density estimate is adjusted automatically
##D ## for the number of mashed clusters (9)
##D 
##D predict(fit1)
##D predict(fit2)
##D fit1$proctime
##D fit2$proctime
## End(Not run)

## two-phase design: preliminary sample across region,
## followed by selection of sites for intensive grids
## Not run: 
##D arena <- data.frame(x = c(0,2000,2000,0), y = c(0,0,2500,2500))
##D t1 <- make.grid(nx = 1, ny = 1)
##D t4 <- make.grid(nx = 4, ny = 4, spacing = 50)
##D singletraps <- make.systematic (n = c(8,10), cluster = t1,
##D     region = arena)
##D CH <- sim.capthist(singletraps, popn = list(D = 2))
##D plot(CH, type = "n.per.cluster", title = "Number per cluster")
##D temp <- trap.builder(10, frame = traps(CH), cluster = t4,
##D     ranks = cluster.counts(CH), method = "rank",
##D     edgemethod = "allowoverlap", plt = TRUE, add = TRUE)
## End(Not run)




