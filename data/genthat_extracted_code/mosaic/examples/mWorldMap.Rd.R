library(mosaic)


### Name: mWorldMap
### Title: Make a world map with 'ggplot2'
### Aliases: mWorldMap

### ** Examples

## Not run: 
##D gdpData <- CIAdata("GDP")      # load some world data
##D 
##D mWorldMap(gdpData, key="country", fill="GDP")
##D 
##D gdpData <- gdpData %>% mutate(GDP5 = ntiles(-GDP, 5, format="rank")) 
##D mWorldMap(gdpData, key="country", fill="GDP5")
##D 
##D mWorldMap(gdpData, key="country", plot="frame") +
##D geom_point()
##D 
##D mergedData <- mWorldMap(gdpData, key="country", plot="none")
##D 
##D ggplot(mergedData, aes(x=long, y=lat, group=group, order=order)) +
##D geom_polygon(aes(fill=GDP5), color="gray70", size=.5) + guides(fill=FALSE)  
## End(Not run)



