library(RStoolbox)


### Name: readEE
### Title: Tidy import tool for EarthExplorer .csv export files
### Aliases: readEE

### ** Examples

library(ggplot2)
ee <- readEE(system.file("external/EarthExplorer_LS8.txt", package = "RStoolbox"))

## Scenes with cloud cover < 20%
ee[ee$Cloud.Cover < 20,]

## Available time-series
ggplot(ee) + 
     geom_segment(aes(x = Date, xend = Date, y = 0, yend = 100 - Cloud.Cover, 
     col = as.factor(Year))) +
        scale_y_continuous(name = "Scene quality (% clear sky)")




