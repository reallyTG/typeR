library(wux)


### Name: cmip5_2050
### Title: Climate Change signals for CMIP5 ensemble
### Aliases: cmip5_2050
### Keywords: datasets

### ** Examples

require(wux)
data(cmip5_2050)

str(cmip5_2050)
summary(cmip5_2050)

tas.range <- c(0, 2.5)
pr.range <- c(-10, 15)
## Not run: 
##D plot(cmip5_2050, "delta.air_temperature",
##D               "perc.delta.precipitation_amount", boxplots = TRUE,
##D               ylim = pr.range, xlim = tas.range, ylab = "Precipitation Amount [##D 
##D               xlab = "2-m Air Temperature [K]", draw.legend = TRUE,
##D               draw.median.lines = FALSE, subreg.subset = "CORDEX.Africa",
##D               main = "CMIP5 2-m Air Temp. and Precip. Amount 1961-1990 to 2021-2050",
##D               label.only.these.models = "", draw.seperate.legend = TRUE,
##D               copyright = TRUE, horiz.box.col = "coral", vert.box.col = "cyan")
## End(Not run)



