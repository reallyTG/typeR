library(lattice)


### Name: H_barley
### Title: Yield data from a Minnesota barley trial
### Aliases: barley
### Keywords: datasets

### ** Examples

# Graphic suggesting the Morris data switched the years 1931 and 1932
# Figure 1.1 from Cleveland
dotplot(variety ~ yield | site, data = barley, groups = year,
        key = simpleKey(levels(barley$year), space = "right"),
        xlab = "Barley Yield (bushels/acre) ",
        aspect=0.5, layout = c(1,6), ylab=NULL)



