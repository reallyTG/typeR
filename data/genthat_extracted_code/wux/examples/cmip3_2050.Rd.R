library(wux)


### Name: cmip3_2050
### Title: Climate Change signals for CMIP3 ensemble
### Aliases: cmip3_2050
### Keywords: datasets

### ** Examples

require(wux)
data(cmip3_2050)

str(cmip3_2050)
summary(cmip3_2050)

## Not run: 
##D plot(cmip3_2050,  "perc.delta.precipitation_amount",
##D               "delta.air_temperature",  subreg.subset = "CORDEX.Africa",
##D               boxplots = TRUE, xlim = c(-10,10), label.only.these.models = "",
##D               ylim = c(0, 3), xlab = "Precipitation Amount [%]",
##D               ylab = "2-m Air Temperature [K]", draw.legend = FALSE,
##D               draw.median.lines = FALSE, 
##D               main = "CMIP3 2-m Air Temp. and Precip. Amount")
## End(Not run)



