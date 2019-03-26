library(matchingMarkets)


### Name: stabchk
### Title: Stability-Check
### Aliases: stabchk
### Keywords: algorithms

### ** Examples



## 1-a. Generate preferences for colleges
c.prefs = matrix(c(1,2,3,
                   3,2,1,
                   3,2,1),
                    byrow = FALSE, ncol = 3); c.prefs

## 1-b. Generate preferences for students
s.prefs = matrix(c(1,2,3,
                   3,2,1,
                   2,1,3),
                 byrow = FALSE, ncol = 3);s.prefs

## 1-c. Generate matching
matching = matrix(c(1,2,
                    2,1,
                    3,3),
                  byrow = TRUE, ncol = 2); matching

## 1-d. Check stability
stabchk(matching = matching, c.prefs = c.prefs, s.prefs = s.prefs)

## 2-a. Generate new matching without blocking pairs as a data frame
matching = data.frame('colleges' = c(1,2,3), 'student' = c(1,3,2))
stabchk(matching = matching, c.prefs = c.prefs, s.prefs = s.prefs)

## 3-a. Example with missing values:
matching  <- matrix(c(1,1,2,2,3,3), byrow = FALSE, ncol = 2)
c.prefs <- matrix(c(1,1,3,rep(NA, 6)), byrow = TRUE, ncol = 3)
s.prefs <- matrix(c(2,2,3,rep(NA, 6)), byrow = TRUE, ncol = 3)
stabchk(matching = matching, c.prefs = c.prefs, s.prefs = s.prefs)



