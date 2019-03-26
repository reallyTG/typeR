library(AmpliconDuo)


### Name: plotORdensity
### Title: Probability Density Plot Of Odds Ratios
### Aliases: plotORdensity
### Keywords: hplot

### ** Examples

## loads example data of ampliconduo data frames
data(amplicons)

## plot odds ratio density for amplicon frequencies in ampliconduo data frames
plotORdensity(amplicons)
plotORdensity(amplicons[1:4], binwidth = 0.1, color = "magenta")
plotORdensity(amplicons[[1]], binwidth = 0.1, color = "orange", main = "Sample FU25")
plotORdensity(amplicons[1:4],  color = "darkblue", ncol = 2, save = TRUE)




