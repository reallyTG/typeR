library(ACSWR)


### Name: ST_Ordered
### Title: Simulating Random Observations from an Arbitrary Distribution
### Aliases: ST_Ordered
### Keywords: Arbitrary discrete distribution Simulation unordered
###   probabilities

### ** Examples

N <- 1e4
x <- 1:10
p_x <- c(0.05,0.17,0.02,0.14,0.11,0.06,0.05,0.04,0.17,0.19)
table(ST_Ordered(N, x, p_x))



