library(PMCMR)


### Name: posthoc.quade.test
### Title: Pairwise post-hoc Test for Multiple Comparisons of Rank Sums for
###   Unreplicated Blocked Data (Quade multiple comparison test)
### Aliases: posthoc.quade.test posthoc.quade.test.default
### Keywords: htest nonparametric

### ** Examples

## Conover (1999, p. 375f):
## Numbers of five brands of a new hand lotion sold in seven stores
## during one week.
y <- matrix(c( 5,  4,  7, 10, 12,
               1,  3,  1,  0,  2,
              16, 12, 22, 22, 35,
               5,  4,  3,  5,  4,
              10,  9,  7, 13, 10,
              19, 18, 28, 37, 58,
              10,  7,  6,  8,  7),
            nrow = 7, byrow = TRUE,
            dimnames =
            list(Store = as.character(1:7),
                 Brand = LETTERS[1:5]))
y
quade.test(y)
posthoc.quade.test(y, dist="TDist", p.adj="none")



