library(intubate)


### Name: latticeExtra
### Title: Interfaces for latticeExtra package for data science pipelines.
### Aliases: ntbt_ecdfplot ntbt_mapplot ntbt_rootogram ntbt_segplot
###   ntbt_tileplot
### Keywords: intubate magrittr latticeExtra ecdfplot mapplot rootogram
###   segplot tileplot

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(latticeExtra)
##D 
##D 
##D ## ntbt_ecdfplot: Trellis Displays of Empirical CDF
##D data(singer, package = "lattice")
##D 
##D ## Original function to interface
##D ecdfplot(~height | voice.part, data = singer)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ecdfplot(singer, ~height | voice.part)
##D 
##D ## so it can be used easily in a pipeline.
##D singer %>%
##D   ntbt_ecdfplot(~height | voice.part)
##D 
##D 
##D ## ntbt_mapplot: Trellis displays on Maps a.k.a. Choropleth maps
##D library(maps)
##D library(mapproj)
##D data(USCancerRates)
##D 
##D ## Original function to interface
##D ## Note: Alaska, Hawaii and others are not included in county map;
##D ## this generates warnings with both USCancerRates and ancestry.
##D suppressWarnings(print(
##D   
##D   mapplot(rownames(USCancerRates) ~ log(rate.male) + log(rate.female),
##D           data = USCancerRates,
##D           map = map("county", plot = FALSE, fill = TRUE,
##D                     projection = "mercator"))
##D   
##D ))
##D 
##D ## The interface puts data as first parameter
##D suppressWarnings(print(
##D   
##D   ntbt_mapplot(USCancerRates, rownames(USCancerRates) ~ log(rate.male) + log(rate.female),
##D                map = map("county", plot = FALSE, fill = TRUE,
##D                          projection = "mercator"))
##D 
##D   ))
##D 
##D ## so it can be used easily in a pipeline.
##D suppressWarnings(print(
##D   
##D   USCancerRates %>%
##D   ntbt_mapplot(rownames(USCancerRates) ~ log(rate.male) + log(rate.female),
##D                map = map("county", plot = FALSE, fill = TRUE,
##D                          projection = "mercator"))
##D 
##D   ))
##D 
##D 
##D ## ntbt_rootogram: Trellis Displays of Tukey's Hanging Rootograms
##D library(lattice)
##D dta <- data.frame(x = rpois(1000, lambda = 50))
##D 
##D ## Original function to interface
##D rootogram(~x, data = dta, dfun = function(x) dpois(x, lambda = 50))
##D 
##D ## The interface puts data as first parameter
##D ntbt_rootogram(dta, ~x, dfun = function(x) dpois(x, lambda = 50))
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_rootogram(~x, dfun = function(x) dpois(x, lambda = 50))
##D 
##D 
##D ## ntbt_segplot: Plot segments using the Trellis framework
##D data(USCancerRates)
##D 
##D ## Original function to interface
##D segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male,
##D         data = subset(USCancerRates, state == "Washington"))
##D 
##D ## The interface puts data as first parameter
##D ntbt_segplot(subset(USCancerRates, state == "Washington"),
##D              reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male)
##D 
##D ## so it can be used easily in a pipeline.
##D subset(USCancerRates, state == "Washington") %>%
##D   ntbt_segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male)
##D 
##D USCancerRates %>%
##D   subset(state == "Washington") %>%
##D   ntbt_segplot(reorder(factor(county), rate.male) ~ LCL95.male + UCL95.male)
##D 
##D 
##D ## ntbt_tileplot: Plot a spatial mosaic from irregular 2D points
##D tmp <- state.center
##D tmp$Income <- state.x77[,"Income"]
##D library(deldir)
##D 
##D ## Original function to interface
##D tileplot(Income ~ x * y, tmp, border = "black",
##D          panel = function(x, y, ...) {
##D            panel.voronoi(x, y, ..., points = FALSE)
##D            panel.text(x, y, state.abb, cex = 0.6)
##D          })
##D 
##D ## The interface puts data as first parameter
##D ntbt_tileplot(tmp, Income ~ x * y, border = "black",
##D               panel = function(x, y, ...) {
##D                 panel.voronoi(x, y, ..., points = FALSE)
##D                 panel.text(x, y, state.abb, cex = 0.6)
##D               })
##D 
##D ## so it can be used easily in a pipeline.
##D tmp %>%
##D   ntbt_tileplot(Income ~ x * y, border = "black",
##D                 panel = function(x, y, ...) {
##D                   panel.voronoi(x, y, ..., points = FALSE)
##D                   panel.text(x, y, state.abb, cex = 0.6)
##D                 })
## End(Not run)



