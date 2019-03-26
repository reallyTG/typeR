library(Epi)


### Name: mh
### Title: Mantel-Haenszel analyses of cohort and case-control studies
### Aliases: mh
### Keywords: htest

### ** Examples

# If d and y are 3-way tables of cases and person-years 
# observation formed by tabulation by two confounders 
# (named "C1" and "C2") an exposure of interest ("E"), 
# the following command will calculate an overall 
# Mantel-Haenszel comparison of the first two exposure 
# groups.
#
# Generate some bogus data
dnam <- list( E=c("low","medium","high"), C1=letters[1:2], C2=LETTERS[1:4] )
d <- array( sample( 2:80, 24),
            dimnames=dnam, dim=sapply( dnam, length ) )
y <- array( abs( rnorm( 24, 227, 50 ) ),
            dimnames=dnam, dim=sapply( dnam, length ) )
mh(d, y, compare="E")
#
# Or, if exposure levels named "low" and "high" are to be 
# compared and these are not the first two levels of E :
#
mh(d, y, compare="E", levels=c("low", "high"))
#
# If we wish to carry out an analysis which controls for C1, 
# but examines the results at each level of C2:
#
mh(d, y, compare="E", by="C2")
#
# It is also possible to look at rate ratios for every 
# combination of C1 and C2 :
#
mh(d, y, compare="E", by=c("C1", "C2"))
#
# If dimensions and levels of the table are unnamed, they must 
# be referred to by number.
#



