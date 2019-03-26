library(circlize)


### Name: circos.trackPoints
### Title: Add points to the plotting regions in a same track
### Aliases: circos.trackPoints

### ** Examples

circos.initialize(letters[1:8], xlim = c(0, 1))
df = data.frame(fa = sample(letters[1:8], 100, replace = TRUE),
                x = runif(100), y = runif(100))
circos.track(ylim = c(0, 1))
circos.trackPoints(df$fa, x = df$x, y = df$y, pch = 16, col = as.numeric(factor(df$fa)))
circos.clear()




