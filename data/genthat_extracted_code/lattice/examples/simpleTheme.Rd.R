library(lattice)


### Name: C_03_simpleTheme
### Title: Function to generate a simple theme
### Aliases: simpleTheme
### Keywords: dplot

### ** Examples


str(simpleTheme(pch = 16))

dotplot(variety ~ yield | site, data = barley, groups = year,
        auto.key = list(space = "right"),
        par.settings = simpleTheme(pch = 16),
        xlab = "Barley Yield (bushels/acre) ",
        aspect=0.5, layout = c(1,6))




