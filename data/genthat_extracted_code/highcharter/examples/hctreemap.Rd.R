library(highcharter)


### Name: hctreemap
### Title: Shortcut for create treemaps
### Aliases: hctreemap

### ** Examples

 
## Not run: 
##D 
##D library("treemap")
##D library("viridis")
##D 
##D data(GNI2014)
##D head(GNI2014)
##D 
##D tm <- treemap(GNI2014, index = c("continent", "iso3"),
##D               vSize = "population", vColor = "GNI",
##D               type = "comp", palette = rev(viridis(6)),
##D               draw = FALSE)
##D 
##D hctreemap(tm, allowDrillToNode = TRUE, layoutAlgorithm = "squarified") %>% 
##D    hc_title(text = "Gross National Income World Data") %>% 
##D    hc_tooltip(pointFormat = "<b>{point.name}</b>:<br>
##D                              Pop: {point.value:,.0f}<br>
##D                              GNI: {point.valuecolor:,.0f}")
##D 
## End(Not run)




