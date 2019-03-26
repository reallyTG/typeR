library(IncucyteDRC)


### Name: calculateCutTimeForGrowthCurve
### Title: calculateCutTimeForGrowthCurve
### Aliases: calculateCutTimeForGrowthCurve

### ** Examples

pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
data_file <- system.file(file='extdata/example_data.txt', package='IncucyteDRC')
test_data <- importIncucyteData(data_file, metric='pc')

test_list <- splitIncucyteDRCPlateData(test_pm, test_data, group_columns='growthcondition')

print(test_list)

test_idrc_set <- fitGrowthCurvesGrouped(test_list[[2]])
plotIncucyteDRCSet(test_idrc_set, grouped=TRUE)
test_idrc_set$fitted_models_grouped
test_gcm <- test_idrc_set$fitted_models_grouped$gc_model[[1]]
test_gcm
calculateCutTimeForGrowthCurve(test_gcm, baseline_time=24, no_doublings=4, max_val=80)




