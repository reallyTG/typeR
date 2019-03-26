library(DIconvex)


### Name: DIconvex
### Title: Finding patterns of monotonicity and convexity in
###   two-dimensional data
### Aliases: DIconvex

### ** Examples

x = c(315, 320, 325, 330, 335, 340, 345, 350)
upper = c(0.5029714, 0.5633280, 0.6840411, 0.8751702, 3.0000000, 1.5692708, 2.3237279, 3.5207998)
lower = c(0.2514857, 0.4325554, 0.4325554, 0.6236845, 2.5000000, 1.1870125, 1.9414696, 3.1385415)

DIconvex(x, lower, upper, increasing = TRUE)

x = c(340, 345, 350, 355, 360, 365)
lower = c(2.7661994, 1.3177168, 1.5029454, 0.1207069, 0.1207069, 0.1207069)
upper = c(3.1383790, 1.5088361, 1.6236522, 0.3721796, 0.1810603, 0.2514727)

DIconvex(x, lower, upper, increasing = FALSE)



