library(matchingMarkets)


### Name: ttc
### Title: Top-Trading-Cycles Algorithm with existing tenants
### Aliases: ttc
### Keywords: algorithms

### ** Examples

##\dontrun{
## 1-a. Generate matrix of individuals' preference rankings over objects,
## a.k.a. Rank Order Lists (ROL).
s.prefs <- matrix(c(3,2,4,1,        # ROL of student 1
                   3,5,6, NA,
                   3,1, NA,NA,
                   2,5,6,4,
                   1,3,2,NA,
                   2,4,5,6), nrow = 4, ncol = 6, byrow = FALSE); s.prefs

## 1-b. Generate vector of house occupation objects ('obj') and their owners ('ind')
(houses <- 1:6)

## 1-c. Find assignment based on TTC algorithm
ttc(s.prefs = s.prefs, houses = houses, nHouses = 6, priority = 1:6)

## 2-a.Compare the example in the paper Abdulkadiroglu et al. (1999)
## on page 246-248 (section 5.1 An Example):
## generate matrix of students' preference rankings over houses, a.k.a. Rank Order Lists (ROL)
s.prefs <- matrix(c(2,6,5,1,4,3,7,NA,
                 7,1,6,5,4,3,2,NA,
                 2,1,4,7,3,6,5,NA,
                 2,4,3,6,1,7,5,NA,
                 4,3,7,1,2,5,6,NA), byrow = FALSE, ncol= 5); s.prefs

## 2-b. Generate house occupation, so student 1 lives in house 1, ..., student 4 lives in house 4
## and the other houses are vacant.
houses <- c(1,2,3,4,NA,NA,NA,NA); houses

## 2-c. Generate priority ordering
priority <- 1:5

## 2-d. Find assigment
ttc(s.prefs = s.prefs, houses = houses, priority = priority)
##}



