library(circlize)


### Name: circos.trackPlotRegion
### Title: Create plotting regions for a whole track
### Aliases: circos.trackPlotRegion

### ** Examples

circos.initialize(letters[1:8], xlim = c(0, 1))
set.seed(123)
df = data.frame(fa = sample(letters[1:8], 100, replace = TRUE),
                x = runif(100), y = rnorm(100))
circos.track(ylim = c(0, 1), bg.col = rand_color(8))
circos.track(df$fa, x = df$x, y = df$y, panel.fun = function(x, y) {
    circos.points(x, y)
}, track.height = 0.2, bg.border = rand_color(8))
circos.clear()




