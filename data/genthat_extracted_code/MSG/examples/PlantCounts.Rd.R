library(MSG)


### Name: PlantCounts
### Title: Number of plants corresponding to altitude
### Aliases: PlantCounts

### ** Examples

## different span for LOWESS
data(PlantCounts)
par(las = 1, mar = c(4, 4, 0.1, 0.1), mgp = c(2.2, 0.9, 0))
with(PlantCounts, {
    plot(altitude, counts, pch = 20, col = rgb(0, 0, 0, 0.5), panel.first = grid())
    for (i in seq(0.01, 1, length = 70)) {
        lines(lowess(altitude, counts, f = i), col = rgb(0, i, 0), lwd = 1.5)
    }
})



