library(IncucyteDRC)


### Name: print.IncucyteDRCSet
### Title: print.IncucyteDRCSet
### Aliases: print.IncucyteDRCSet

### ** Examples

pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
data_file <- system.file(file='extdata/example_data.txt', package='IncucyteDRC')
test_data <- importIncucyteData(data_file, metric='pc')
test_list <- splitIncucyteDRCPlateData(test_pm, test_data, group_columns='growthcondition')
class(test_list)
class(test_list[[2]])
print(test_list[[2]])



