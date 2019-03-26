library(flux)


### Name: chop
### Title: Prepare data for flux rate estimation with 'flux' or GPP/Reco
###   modelling.
### Aliases: chop
### Keywords: manip

### ** Examples

## load example data
data(tt.pre)

## extract field concentration measurements
gcd <- tt.pre[tt.pre$sampletype_a=="P",]

## partition the data into data tables per chamber measurement
gcd.parts <- chop(gcd, factors = c("date", "spot", "veg"), 
nmes = c("date", "veg", "spot"))
# have a look at the first three tables
gcd.parts$tables[1:3]
# have a look at the names part of the returned object
gcd.parts$nmes
# use inspect to have a look at (a) specific data table(s)
inspect(gcd.parts, c("2011-03-15.c.3", "2011-03-15.c.6", "2011-03-15.p.6"))
# inspect the same tables using their indices
inspect(gcd.parts, c(3,6,12))
inspect(gcd.parts, c("c.3", "c.6", "p.6"))



