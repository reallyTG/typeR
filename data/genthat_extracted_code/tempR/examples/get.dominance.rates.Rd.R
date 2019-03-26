library(tempR)


### Name: get.dominance.rates
### Title: Get TDS dominance rates
### Aliases: get.dominance.rates

### ** Examples

x <- rbind(c( 6,  6,  8, 14, 16, 22, 22, 21, 13, 11, 14,  7,  7,  6,  5,  3),
           c(14, 24, 31, 36, 37, 39, 44, 48, 51, 55, 48, 40, 30, 20, 10,  5),
           c( 7,  8,  9, 15, 17, 21, 21, 20, 21, 22, 18, 17, 17, 20, 20, 20),
           c(44, 23, 23, 26,  1,  2,  2,  2,  2,  3,  4,  7, 15, 14, 18, 22),
           c(20, 30, 20,  0, 20,  7,  2,  0,  4,  0,  7, 20, 22, 31, 38, 41))
colnames(x) <- 0:15
get.dominance.rates(x, n = 91)



