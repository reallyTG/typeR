library(matchingMarkets)


### Name: ttc2
### Title: Top-Trading-Cycles Algorithm for a two sided matching problem
### Aliases: ttc2
### Keywords: algorithms

### ** Examples

##\dontrun{
## 1-a. Compare example from the Abdulkadiroglu et al. (2003) (in the Appendix, page 742-744)
## 1-b. Generate matrix of students' preference rankings over schools, a.k.a. Rank Order Lists (ROL)
s.prefs <- matrix(c(
                  2,1,3,4,
                  1,2,3,4,
                  3,2,1,4,
                  3,4,1,2,
                  1,3,4,2,
                  4,1,2,3,
                  1,2,3,4,
                  1,2,4,3),
                  byrow = FALSE, ncol = 8); s.prefs

## 1-c. Generate matrix of schools' preference rankings over students, a.k.a. Rank Order Lists (ROL)
c.prefs <- matrix(c(
                  1,2,3,4,5,6,7,8,
                  3,5,4,8,7,2,1,6,
                  5,3,1,7,2,8,6,4,
                  6,8,7,4,2,3,5,1),
                  byrow = FALSE, ncol = 4); c.prefs

## 1-d. Generate capacities
nSlots <- c(2,2,3,3)

## 1-e. Find assignment based on TTC algorithm
ttc2(s.prefs = s.prefs, c.prefs = c.prefs, nSlots = nSlots)

## 2-a. Generate college preferences with college 1 only ranking student 1
c.prefs <- matrix(c(
                   1,rep(NA,7),
                   3,5,4,8,7,2,1,6,
                   5,3,1,7,2,8,6,4,
                   6,8,7,4,2,3,5,1),
                   byrow = FALSE, ncol = 4); c.prefs

## 2-b. Find assignment based on TTC algorithm
ttc2(s.prefs = s.prefs, c.prefs = c.prefs, nSlots = nSlots, priority = 1:8)

## If all schools have the same preferences the two sided ttc and the serial dictator yield
## the same outcome if the preferences are taken to be the prioirty order for the serial dictator

# Preferences are the same for all schools:
c.prefs <- matrix(c(
                  5,3,1,7,2,8,6,4,
                  5,3,1,7,2,8,6,4,
                  5,3,1,7,2,8,6,4,
                  5,3,1,7,2,8,6,4),
                  byrow = FALSE, ncol = 4)
priority <- c.prefs[,1]

match_ttc <- ttc2(s.prefs = s.prefs, c.prefs = c.prefs, nSlots = nSlots); match_ttc
match_sd <- rsd(prefs = s.prefs, priority = priority, nSlots = nSlots); match_sd
all(match_ttc == match_sd)
##}



