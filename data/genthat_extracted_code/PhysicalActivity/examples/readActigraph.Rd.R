library(PhysicalActivity)


### Name: readActigraph
### Title: Read ActiGraph Accelerometer Data
### Aliases: readActigraph

### ** Examples

## Not run: 
##D dat <- readActigraph("actfile.agd")
##D dat1s <- wearingMarking(dataset = dat,
##D                        frame = 90,
##D                        perMinuteCts = 1,
##D                        TS = "TimeStamp",
##D                        cts = "axis1",
##D                        streamFrame = NULL,
##D                        allowanceFrame= 2,
##D                        newcolname = "wearing",
##D                        getMinuteMarking = FALSE)
## End(Not run)



