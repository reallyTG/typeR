library(astrolibR)


### Name: helio
### Title: Compute (low-precision) heliocentric coordinates for the planets
### Aliases: helio
### Keywords: misc

### ** Examples

# (1) Find the current heliocentric positions of all the planets

jd_today <- 2456877.5
helio(jd_today,seq(1,9))

# (2) Find heliocentric position of Mars on August 23, 2000 
# Result: hrad = 1.6407 AU hlong = 124.3197 hlat = 1.7853
# For comparison, the JPL ephemeris gives hrad = 1.6407 AU hlong = 124.2985 hlat = 1.7845
helio(2451779.5,4)



