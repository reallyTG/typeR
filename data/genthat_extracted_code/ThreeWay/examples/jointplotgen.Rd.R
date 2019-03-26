library(ThreeWay)


### Name: jointplotgen
### Title: Jointplots
### Aliases: jointplotgen
### Keywords: array multivariate algebra

### ** Examples

data(Bus)
# labels for Bus data
laba <- rownames(Bus)
labb <- substr(colnames(Bus)[1:5], 1, 1)
labc <- substr(colnames(Bus)[seq(1,ncol(Bus),5)], 3, 8)
# <- T3 solution
BusT3 <- T3funcrep(Bus, 7, 5, 37, 2, 2, 2, 0, 1e-6)
# Joint plot for mode C and component 2
jointplotgen(BusT3$H, BusT3$A, BusT3$B, BusT3$C, 3, 2, laba, labb, labc)



