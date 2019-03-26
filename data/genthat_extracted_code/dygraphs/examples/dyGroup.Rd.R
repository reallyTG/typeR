library(dygraphs)


### Name: dyGroup
### Title: dygraph series group
### Aliases: dyGroup

### ** Examples

## Not run: 
##D library(dygraphs)
##D 
##D lungDeaths <- cbind(ldeaths, mdeaths, fdeaths)
##D 
##D dygraph(lungDeaths, main = "Deaths from Lung Disease (UK)") %>%
##D   dySeries("fdeaths", stepPlot = TRUE, color = "red") %>% 
##D   dyGroup(c("mdeaths", "ldeaths"), drawPoints = TRUE, color = c("blue", "green"))
## End(Not run)   




