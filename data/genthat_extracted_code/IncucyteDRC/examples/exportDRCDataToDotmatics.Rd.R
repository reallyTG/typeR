library(IncucyteDRC)


### Name: exportDRCDataToDotmatics
### Title: exportDRCDataToDotmatics
### Aliases: exportDRCDataToDotmatics

### ** Examples

pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
data_file <- system.file(file='extdata/example_data.txt', package='IncucyteDRC')
test_data <- importIncucyteData(data_file, metric='pc')

test_drc <- splitIncucyteDRCPlateData(test_pm, test_data, group_columns='growthcondition')
test_drc <- lapply(test_drc, fitGrowthCurvesIndividual)
test_drc <- lapply(test_drc, fitGrowthCurvesGrouped)
test_drc <- lapply(test_drc, calculateDRCData, cut_time=100)
print(test_drc)
print(test_drc[[2]])
exportDRCDataToDotmatics(test_drc, test_pm)
exportDRCDataToDotmatics(test_drc[[2]], test_pm)



