library(matchingMarkets)


### Name: ttcc
### Title: Top-Trading-Cycles and Chains Algorithm
### Aliases: ttcc
### Keywords: algorithms

### ** Examples

##\dontrun{
## Compare Example 1 from Roth et al. (2004) on page 469 - 475
## generate matrix of patients' preference rankings over kidneys, a.k.a. Rank Order Lists (ROL)

prefs <- matrix(c( 9,10, 1,NA,NA,NA,NA,
                  11, 3, 5, 6, 2,NA,NA,
                   2, 4, 5, 6, 7, 8,13,
                   5, 9, 1, 8,10, 3,13,
                   3, 7,11, 4, 5,NA,NA,
                   3, 5, 8, 6,NA,NA,NA,
                   6, 1, 3, 9,10, 1,13,
                   6, 4,11, 2, 3, 8,NA,
                   3,11,13,NA,NA,NA,NA,
                  11, 1, 4, 5, 6, 7,13,
                   3, 6, 5,11,NA,NA,NA,
                  11, 3, 9, 8,10,12,NA),
              byrow = FALSE, ncol = 12); prefs
priority <- 1:12
ttcc(prefs = prefs, priority = priority)
## The final matching differs slightly because in Round 3 another chain is chosen due to a different
## decision rule (compare Figure 3, p472. Here W1 instead of W2 is chosen)
##}



