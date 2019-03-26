library(IncucyteDRC)


### Name: importPlatemapXML
### Title: importPlatemapXML
### Aliases: importPlatemapXML

### ** Examples

#example data 1
pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
head(test_pm)

#example data 2
pm_file2 <- system.file(file='extdata/example2.PlateMap', package='IncucyteDRC')
test_pm2 <- importPlatemapXML(pm_file2)
head(test_pm2)



