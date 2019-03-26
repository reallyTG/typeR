library(IncucyteDRC)


### Name: plotPlatemap
### Title: plotPlatemap
### Aliases: plotPlatemap

### ** Examples

pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
plotPlatemap(test_pm)

library(magrittr)
pm_file2 <- system.file(file='extdata/example2.PlateMap', package='IncucyteDRC')
importPlatemapXML(pm_file2) %>% plotPlatemap()



