library(mosaic)


### Name: mUSMap
### Title: Make a US map with 'ggplot2'
### Aliases: mUSMap

### ** Examples

USArrests2 <- USArrests %>% mutate(state = row.names(.))
mUSMap(USArrests2, key="state", fill = "UrbanPop") 



