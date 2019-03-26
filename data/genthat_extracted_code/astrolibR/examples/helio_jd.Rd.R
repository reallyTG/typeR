library(astrolibR)


### Name: helio_jd
### Title: Convert geocentric (reduced) Julian date to heliocentric Julian
###   date
### Aliases: helio_jd
### Keywords: misc

### ** Examples

# What is the heliocentric Julian date of an observation of V402 Cygni
# (J2000: RA = 20 9 7.8, Dec = 37 09 07) taken June 15, 1973 at 11:40 UT?
# Result: hjd = 41848.9881

jd <- juldate(c(1973,6,15,11,40))   #  Get geocentric Julian date
hjd <- helio_jd(jd, ten(20,9,7.8)*15., ten(37,9,7))  



