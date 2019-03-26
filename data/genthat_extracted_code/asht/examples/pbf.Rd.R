library(asht)


### Name: pbf
### Title: Behrens-Fisher distribution
### Aliases: pbf qbf
### Keywords: internal

### ** Examples

# See Table 1 from Kim and Cohen, 1996
# at v1=n1-1=8 and v2=n2-1=12 with 45 degrees = 45*pi/180 radians
# for 0.95th percentile
# Table gives: 1.83496
qbf(0.95,9,13,45*pi/180)
# check Inf degrees of freedom, should give qnorm value
qbf(.95,Inf,Inf,45*pi/180)
qnorm(.95)



