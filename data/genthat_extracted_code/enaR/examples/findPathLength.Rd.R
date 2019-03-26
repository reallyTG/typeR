library(enaR)


### Name: findPathLength
### Title: Cumulative Flow over a Range of Path Lengths
### Aliases: findPathLength

### ** Examples




data(troModels)
pl10 <- findPathLength(troModels[[6]], plot.sw = TRUE, maxPath = 10)
names(pl10)
pl10$thresholds





