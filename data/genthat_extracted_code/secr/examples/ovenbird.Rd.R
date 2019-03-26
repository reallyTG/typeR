library(secr)


### Name: ovenbird
### Title: Ovenbird Mist-netting Dataset
### Aliases: ovenbird ovenCH ovenCHp ovenbird.model.1 ovenbird.model.1b
###   ovenbird.model.1T ovenbird.model.h2 ovenbird.model.D ovenmask
### Keywords: datasets

### ** Examples


## Not run: 
##D 
##D ## commands used to create ovenCH from the input files
##D ## "netsites0509.txt" and "ovencapt.txt"
##D ## for information only - these files not distributed
##D netsites0509 <- read.traps(file = "netsites0509.txt",
##D     skip = 1, detector = "proximity")
##D temp <- read.table("ovencapt.txt", colClasses=c("character",
##D     "character", "numeric", "numeric", "character"))
##D ovenCHp <- make.capthist(temp, netsites0509, covnames=c("Sex"))
##D ovenCHp <- updateCH(ovenCHp)   # drop repeat detections
## End(Not run)

par(mfrow = c(1,5), mar = c(1,1,4,1))
plot(ovenCHp, tracks = TRUE, varycol = TRUE)
par(mfrow = c(1,1), mar = c(5,4,4,2) + 0.1)  ## defaults

counts(ovenCHp, "n")

## Not run: 
##D ## trimmed version of data - for consistency with earlier versions
##D 
##D ovenCH <- reduce(ovenCHp, outputdetector = "multi", dropunused = FALSE)
##D 
##D ## array constant over years, so build mask only once
##D ovenmask <- make.mask(traps(ovenCH)[["2005"]], type="pdot", buffer=400,
##D     spacing=15, detectpar=list(g0=0.03, sigma=90), nocc=10)
##D 
##D ## fit constant-density model
##D ovenbird.model.1 <- secr.fit(ovenCH, mask = ovenmask)
##D ovenbird.model.1
##D 
##D ## fit net avoidance model
##D ovenbird.model.1b <- secr.fit(ovenCH, mask = ovenmask, model =
##D     list(g0~b))
##D ovenbird.model.1b
##D 
##D ## fit model with time trend in detection
##D ovenbird.model.1T <- secr.fit(ovenCH, mask = ovenmask, model =
##D     list(g0 ~ T))
##D ovenbird.model.1T
##D 
##D ## fit model with 2-class mixture for g0
##D ovenbird.model.h2 <- secr.fit(ovenCH, mask = ovenmask, model =
##D     list(g0~h2))
##D ovenbird.model.h2
##D 
## End(Not run)

## compare & average pre-fitted models
AIC (ovenbird.model.1, ovenbird.model.1b, ovenbird.model.1T,
    ovenbird.model.h2)
model.average (ovenbird.model.1,ovenbird.model.1b, ovenbird.model.1T,
    ovenbird.model.h2, realnames = "D")

## select one year to plot
plot(ovenbird.model.1b, newdata = data.frame(session = "2005",
    b = 0))




