library(IncucyteDRC)


### Name: calculateCutTimeForIDRCSet
### Title: calculateCutTimeForIDRCSet
### Aliases: calculateCutTimeForIDRCSet

### ** Examples

pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
data_file <- system.file(file='extdata/example_data.txt', package='IncucyteDRC')
test_data <- importIncucyteData(data_file, metric='pc')

test_list <- splitIncucyteDRCPlateData(test_pm, test_data, group_columns='growthcondition')

print(test_list)

test_idrc_set <- fitGrowthCurvesGrouped(test_list[[2]])
plotIncucyteDRCSet(test_idrc_set, grouped=TRUE)
test_idrc_set <- calculateCutTimeForIDRCSet(test_idrc_set)
plotIncucyteDRCSet(test_idrc_set, grouped=TRUE)
print(test_idrc_set$cut_plot)




