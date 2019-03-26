library(latticeExtra)


### Name: segplot
### Title: Plot segments using the Trellis framework
### Aliases: segplot segplot.formula
### Keywords: hplot

### ** Examples


segplot(factor(1:10) ~ rnorm(10) + rnorm(10), level = runif(10))

data(USCancerRates)

segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"))

segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"),
        draw.bands = FALSE, centers = rate.male)

segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"),
        level = rate.female, col.regions = terrain.colors)

segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
        data = subset(USCancerRates, state == "Washington"),
        draw.bands = FALSE, centers = rate.male, 
        segments.fun = panel.arrows, ends = "both", 
        angle = 90, length = 1, unit = "mm")




