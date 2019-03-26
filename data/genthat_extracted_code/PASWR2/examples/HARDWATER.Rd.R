library(PASWR2)


### Name: HARDWATER
### Title: Mortality and Water Hardness
### Aliases: HARDWATER
### Keywords: datasets

### ** Examples

ggplot(data = HARDWATER, aes(x = hardness, y = mortality, color  = location)) + 
geom_point() + labs(y = "averaged annual mortality per 100,000 males", 
x = "calcium concentration (in parts per million)")



