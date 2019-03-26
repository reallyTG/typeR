library(walkalytics)


### Name: pois_walktimes
### Title: Extract walking times to points-of-interest
### Aliases: pois_walktimes

### ** Examples

## No test: 
# Generate set of POIs
x <- c(895777, 896044, 895639)
y <- c(6004833, 6004886, 6005147)
id <- c("pupil1", "pupil2", "pupil3")
pupils <- data.frame(x = x, y = y, id = id)

# Issue query
isochrone_pois(x = 895815, y = 6004839, pois = pupils, key = "abcd1234") %>% pois_walktimes()
## End(No test)



