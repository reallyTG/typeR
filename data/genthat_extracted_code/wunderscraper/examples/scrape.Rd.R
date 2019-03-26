library(wunderscraper)


### Name: scrape
### Title: Scrape Wunderground API
### Aliases: scrape

### ** Examples

## Not run: 
##D ## ?setApiKey before running examples
##D schedulerMMDD <- scheduler()
##D ## select random county and sample one station from each 0.01 arc degrees
##D ## (roughly 1km^2 at the equator)
##D scrape(schedulerMMDD, c("GEOID", "ZCTA5"), size=c(1, NA, 1), strata=c(NA, NA, "GRID"),
##D        weight="COPOP", cellsize=c(NA, 0.01))
##D ## same, but limit sampling to southeastern US
##D data(zctaRel)
##D SE <- c("01", "05", "12", "13", "21", "22", "24", "28", "37", "45", "47", "51", "54")
##D scrape(schedulerMMDD, c("GEOID", "ZCTA5"), size=c(1, NA, 1), strata=c(NA, NA, "GRID"),
##D        weight="COPOP", cellsize=c(NA, 0.01), sampleFrame=zctaRel[zctaRel $STATEFP %in% SE, ])
##D ## select two states and in each state select a 1 arc degree area (roughly
##D ## 100km^2 at the equator) and sample five zip codes, each stratified into
##D ## 0.01 arc degree areas
##D scrape(schedulerMMDD, c("STATEFP", "GRID", "ZCTA5"), size=c(2, 1, 5, 1),
##D        strata=c(NA, "STATEFP", "GRID", "GRID"), cellsize=c(1, NA, 0.01))
##D ## periodically resample one location
##D sampleFrame <- with(zctaRel, zctaRel[GEOID==sample(GEOID, 1, weight=COPOP), ])
##D plan(schedulerMMDD, '2 hours')
##D repeat {
##D   scrape(schedulerMMDD, "ZCTA5", strata=c(NA, "GRID"), cellsize=0.01, sampleFrame=sampleFrame)
##D   sync(schedulerMMDD) # sync schedule after each sample to wait for next scheduled sample
##D }
##D ## stratify by rural and urban to ensure both types of areas recieve adequate representation
##D zctaRel $RURAL <- log(zctaRel $COPOP) < 10
##D scrape(schedulerMMDD, c("GEOID", "ZCTA5"), size=c(1, 8, 1), strata=c("RURAL", "RURAL", "GRID"),
##D        weight="COPOP", cellsize=c(NA, 0.01), sampleFrame=zctaRel)
## End(Not run)



