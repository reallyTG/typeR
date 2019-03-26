library(matchingMarkets)


### Name: iaa
### Title: Immediate Acceptance Algorithm (a.k.a. Boston mechanism) for
###   two-sided matching markets
### Aliases: iaa
### Keywords: algorithms

### ** Examples

##\dontrun{
## --------------------------------
## --- College admission problem

s.prefs <- matrix(c(1,2,3,
                    1,2,3,
                    1,2,3,
                    2,1,3,
                    2,1,3),
                  byrow = FALSE, ncol = 5, nrow = 3); s.prefs
c.prefs <- matrix(c(1,4,2,3,5,
                    5,2,3,4,1,
                    1,2,3,4,5),
                  byrow = FALSE, ncol = 3, nrow = 5); c.prefs
nSlots <- c(2,2,1)

## Boston mechanism
 iaa(s.prefs = s.prefs, c.prefs = c.prefs, nSlots = nSlots)$matchings

## Gale-Shapley algorithm
 iaa(s.prefs = s.prefs, c.prefs = c.prefs, nSlots = nSlots, acceptance="deferred")$matchings

## Same results for the Gale-Shapley algorithm with hri2() function (but different format)
 set.seed(123)
 iaa(nStudents=7, nSlots=c(3,3), acceptance="deferred")$matchings
 set.seed(123)
 hri2(nStudents=7, nSlots=c(3,3))$matchings
 ##}



