library(IncucyteDRC)


### Name: exportDRCDataToPRISM
### Title: exportDRCDataToPRISM
### Aliases: exportDRCDataToPRISM

### ** Examples

pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
data_file <- system.file(file='extdata/example_data.txt', package='IncucyteDRC')
test_data <- importIncucyteData(data_file, metric='pc')

test_list <- splitIncucyteDRCPlateData(test_pm, test_data, group_columns='growthcondition')

print(test_list)

test_idrc_set <- fitGrowthCurvesGrouped(test_list[[2]])
test_idrc_set <- fitGrowthCurvesIndividual(test_idrc_set)
test_idrc_set <- calculateDRCData(test_idrc_set, cut_time=100)
exportDRCDataToPRISM(test_idrc_set)
exportDRCDataToPRISM(test_idrc_set, include_control=TRUE)
exportDRCDataToPRISM(test_idrc_set, include_control=TRUE, add_metadata=TRUE)




