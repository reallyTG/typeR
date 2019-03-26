library(extremefit)


### Name: bandwidth.grid
### Title: Bandwidth Grid
### Aliases: bandwidth.grid

### ** Examples

hmin <- 0.05
hmax <- 0.2
length <- 20
(h.geometric <- bandwidth.grid(hmin, hmax, length, type = "geometric"))
(h.uniform <- bandwidth.grid(hmin, hmax, length, type = "uniform"))




