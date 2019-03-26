library(ThreeWay)


### Name: T3fitpartitioning
### Title: Fit of each entity per mode
### Aliases: T3fitpartitioning
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5], 1, 1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)], 3, 8)
# T3 solution
BusT3 <- T3funcrep(Bus, 7, 5, 37, 2, 2, 2, 0, 1e-6)
# Fitpartitioning of the T3 solution
FitT3 <- T3fitpartitioning(Bus, 7, 5, 37, BusT3$A, BusT3$B, BusT3$C, BusT3$H, 0, 
 laba, labb, labc)
# Fitpartitioning of the T3 solution (when labels are not available)
FitT3 <- T3fitpartitioning(Bus, 7, 5, 37, BusT3$A, BusT3$B, BusT3$C, BusT3$H, 0)



