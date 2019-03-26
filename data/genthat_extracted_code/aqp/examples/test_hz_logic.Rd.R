library(aqp)


### Name: test_hz_logic
### Title: Test Horizon Logic
### Aliases: test_hz_logic
### Keywords: manip

### ** Examples

## simple example: just one profile
data(sp1)
depths(sp1) <- id ~ top + bottom
s <- horizons(sp1[1, ])

## check
# fails due to missing hz boundary
s$bottom[6] <- NA # missing horizon boundary, common on bottom-most hz
test_hz_logic(s, 'top', 'bottom', strict=FALSE)

# fails due to inconsistent hz boundary
s$bottom[3] <- 30 # inconsistent hz boundary
test_hz_logic(s, 'top', 'bottom', strict=TRUE)


## filtering bad data 
## Not run: 
##D # missing bottom horizons
##D x$hzn_bot[!is.na(x$hzn_top) & is.na(x$hzn_bot)] <- x$hzn_top[!is.na(x$hzn_top) & is.na(x$hzn_bot)]
##D 
##D # remove O horizons where top > bottom
##D bad.O.hz.idx <- which(x$hzn_top > x$hzn_bot)
##D if(length(bad.O.hz.idx) > 0)
##D 	x <- x[-bad.O.hz.idx, ]
## End(Not run)

## checking for bad data: do this before promoting to SoilProfileCollection object
library(plyr)
data(sp1)

# horizon logic can be tested via data.frame, at 2 levels of scrutiny:
ddply(sp1, 'id', test_hz_logic, topcol='top', bottomcol='bottom', strict=FALSE)
ddply(sp1, 'id', test_hz_logic, topcol='top', bottomcol='bottom', strict=TRUE)



