library(wiqid)


### Name: Occupancy Multi-Season
### Title: Multi-season occupancy estimation
### Aliases: occMS0 occMStime occMS occMScovSite

### ** Examples


data(GrandSkinks)
DH <- GrandSkinks[, 1:15]

occMS0(DH, 3)
## No test: 
occMStime(DH, 3, model=list(gamma ~ .interval, epsilon~1, p~.season))
occMScovSite(DH, 3,
   model=list(psi1~habitat, gamma ~ .interval, epsilon~habitat, p~.season),
   data=GrandSkinks)
## End(No test)



