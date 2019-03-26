library(DBEST)


### Encoding: UTF-8

### Name: DBEST
### Title: Detecting Breakpoints and Estimating Segments in Trend (DBEST)
### Aliases: DBEST
### Keywords: ts

### ** Examples


# NDVI data for Site 1 and Site 2 used in Fig. 5, Jamali et al. 2015
data(NDVI.Site1)
NDVI.Site1 <- ts(NDVI.Site1, start=1982, frequency=12)

data(NDVI.Site2)
NDVI.Site2 <- ts(NDVI.Site2, start=1982, frequency=12)

# Trend of NDVI data for Site 1 and Site 2 used in Fig. 4, Jamali et al. 2015)
data(TREND.Site1)
data(TREND.Site2)

# Examples for DBEST’s change detection algorithm 
# detecting three greatest changes in NDVI (Fig. 5a, b)
DBEST.Fig5a <- DBEST(data=NDVI.Site1, data.type="cyclical", 
                 seasonality=12, algorithm="change detection", 
                 breakpoints.no=3, first.level.shift=0.1, 
                 second.level.shift=0.2, duration=24, 
                 distance.threshold="default", alpha=0.05, plot="on")

DBEST.Fig5b <- DBEST(data=NDVI.Site2, data.type="cyclical", 
                 seasonality=12, algorithm="change detection", 
                 breakpoints.no=3, first.level.shift=0.1, 
                 second.level.shift=0.2, duration=24, 
                 distance.threshold="default", alpha=0.05, plot="on")

# detecting changes >= 0.2 NDVI units 
DBEST.examp1 <- DBEST(data=NDVI.Site1, data.type="cyclical", 
                  seasonality=12, algorithm="change detection", 
                  change.magnitude=0.2, first.level.shift=0.1, 
                  second.level.shift=0.2, duration=24, 
                  distance.threshold="default", alpha=0.05, plot="fig1")

DBEST.examp2 <- DBEST(data=TREND.Site2, data.type="non-cyclical", 
                  seasonality="none", algorithm="change detection", 
                  change.magnitude=0.2, first.level.shift=0.1, 
                  second.level.shift=0.2, duration=24, 
                  distance.threshold="default", alpha=0.05, plot="fig1")

## Not run: 
##D # Examples for DBEST’s generalization algorithm 
##D # the most-simplified trend 
##D DBEST.Fig4a <- DBEST(data=TREND.Site1, data.type="non-cyclical", 
##D                    seasonality="none", algorithm="generalization", 
##D                    generalization.percent=100, first.level.shift=0.1, 
##D                    second.level.shift=0.2, duration=24, 
##D                    distance.threshold="default", alpha=0.05, plot="fig1")
##D                    
##D DBEST.examp3 <- DBEST(data=NDVI.Site2, data.type="cyclical", 
##D                   seasonality=12, algorithm="generalization", 
##D                   generalization.percent=100, first.level.shift=0.1, 
##D                   second.level.shift=0.2, duration=24, 
##D                   distance.threshold="default", alpha=0.05, plot="fig1")
##D 
##D # one breakpoint included in the generalized trend
##D DBEST.Fig4b <- DBEST(data=TREND.Site1, data.type="non-cyclical", 
##D                  seasonality="none", algorithm="generalization", 
##D                  breakpoints.no=1, first.level.shift=0.1, 
##D                  second.level.shift=0.2, duration=24, 
##D                  distance.threshold="default", alpha=0.05, plot="fig1")
##D 
##D DBEST.examp4 <- DBEST(data=NDVI.Site2, data.type="cyclical", 
##D                   seasonality=12, algorithm="generalization", 
##D                   breakpoints.no=1, first.level.shift=0.1, 
##D                   second.level.shift=0.2, duration=24, 
##D                   distance.threshold="default", alpha=0.05, plot="fig1")
##D 
##D # the largest variation allowed within the generalized segments <= 0.1 NDVI units
##D DBEST.Fig4c <- DBEST(data=TREND.Site1, data.type="non-cyclical", 
##D                  seasonality="none", algorithm="generalization", 
##D                  change.magnitude=0.1, first.level.shift=0.1, 
##D                  second.level.shift=0.2, duration=24, 
##D                  distance.threshold="default", alpha=0.05, plot="fig1")
##D 
##D DBEST.examp5 <- DBEST(data=NDVI.Site2, data.type="cyclical", 
##D                   seasonality=12, algorithm="generalization", 
##D                   change.magnitude=0.2, first.level.shift=0.1, 
##D                   second.level.shift=0.1, duration=24, 
##D                   distance.threshold="default", alpha=0.05, plot="fig1")
##D 
##D # the least-simplified trend
##D DBEST.Fig4d <- DBEST(data=TREND.Site1, data.type="non-cyclical", 
##D                  seasonality="none", algorithm="generalization", 
##D                  generalization.percent=0, first.level.shift=0.1, 
##D                  second.level.shift=0.2, duration=24, 
##D                  distance.threshold="default", alpha=0.05, plot="fig1")
##D 
##D DBEST.examp6 <- DBEST(data=NDVI.Site2, data.type="cyclical", 
##D                   seasonality=12, algorithm="generalization", 
##D                   generalization.percent=0, first.level.shift=0.1, 
##D                   second.level.shift=0.2, duration=24, 
##D                   distance.threshold="default", alpha=0.05, plot="fig1")
## End(Not run) 
                  



