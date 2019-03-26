library(latticeExtra)


### Name: mapplot
### Title: Trellis displays on Maps a.k.a. Choropleth maps
### Aliases: mapplot mapplot.formula panel.mapplot prepanel.mapplot
### Keywords: hplot

### ** Examples


library(maps)
library(mapproj)

## Note: Alaska, Hawaii and others are not included in county map;
## this generates warnings with both USCancerRates and ancestry.

data(USCancerRates)

suppressWarnings(print(
mapplot(rownames(USCancerRates) ~ log(rate.male) + log(rate.female),
        data = USCancerRates,
        map = map("county", plot = FALSE, fill = TRUE,
                  projection = "mercator"))
))

suppressWarnings(print(
mapplot(rownames(USCancerRates) ~ log(rate.male) + log(rate.female),
        data = USCancerRates,
        map = map("county", plot = FALSE, fill = TRUE,
                  projection = "tetra"),
        scales = list(draw = FALSE))
))

data(ancestry)

county.map <- 
    map('county', plot = FALSE, fill = TRUE, 
        projection = "azequalarea")

## set a sequential color palette as current theme, and use it
opar <- trellis.par.get()
trellis.par.set(custom.theme(region = brewer.pal(9, "Purples"),
                             alpha.line = 0.5))
suppressWarnings(print(
mapplot(county ~ log10(population), ancestry, map = county.map,
    colramp = NULL)
))
trellis.par.set(opar)

## Not run: 
##D 
##D ## this may take a while (should get better area records)
##D 
##D county.areas <- 
##D     area.map(county.map, regions = county.map$names, sqmi = FALSE)
##D     
##D ancestry$density <- 
##D     with(ancestry, population / county.areas[as.character(county)])
##D 
##D mapplot(county ~ log(density), ancestry,
##D         map = county.map, border = NA,
##D         colramp = colorRampPalette(c("white", "black")))
##D 
## End(Not run)




