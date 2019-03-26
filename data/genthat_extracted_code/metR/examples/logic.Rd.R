library(metR)


### Name: logic
### Title: Extended logical operators
### Aliases: logic %~% Similar

### ** Examples

set.seed(198)
x <- rnorm(100)
x[x %~% c(0.3, 0.5, 1)]

# Practical use case: vertical cross-section at
# approximately 36W between 50S and 50N.
cross.lon <- -34 + 360
library(ggplot2)
library(data.table)
ggplot(temperature[lon %~% cross.lon & lat %between% c(-50, 50)],
       aes(lat, lev)) +
    geom_contour(aes(z = air))




