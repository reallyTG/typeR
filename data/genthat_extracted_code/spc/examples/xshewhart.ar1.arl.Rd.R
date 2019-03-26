library(spc)


### Name: xshewhart.ar1.arl
### Title: Compute ARLs of modified Shewhart control charts for AR(1) data
### Aliases: xshewhart.ar1.arl
### Keywords: ts

### ** Examples

## Table 1 in Kramer/Schmid (2000)

cS <- 3.09023
a  <- seq(0, 4, by=.5)
row1 <- row2 <- row3 <- NULL
for ( i in 1:length(a) ) {
  row1 <- c(row1, round(xshewhart.ar1.arl( 0.4, cS, delta=a[i]), digits=2))
  row2 <- c(row2, round(xshewhart.ar1.arl( 0.2, cS, delta=a[i]), digits=2))
  row3 <- c(row3, round(xshewhart.ar1.arl(-0.2, cS, delta=a[i]), digits=2))
}

results <- rbind(row1, row2, row3)
results

# original values are
# row1 515.44 215.48 61.85 21.63 9.19 4.58 2.61 1.71 1.29
# row2 502.56 204.97 56.72 19.13 7.95 3.97 2.33 1.59 1.25
# row3 502.56 201.41 54.05 17.42 6.89 3.37 2.03 1.46 1.20



