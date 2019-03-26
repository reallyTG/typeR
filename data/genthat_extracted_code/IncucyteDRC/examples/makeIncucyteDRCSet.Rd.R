library(IncucyteDRC)


### Name: makeIncucyteDRCSet
### Title: makeIncucyteDRCSet
### Aliases: makeIncucyteDRCSet

### ** Examples

pm_file <- system.file(file='extdata/example.PlateMap', package='IncucyteDRC')
test_pm <- importPlatemapXML(pm_file)
data_file <- system.file(file='extdata/example_data.txt', package='IncucyteDRC')
test_data <- importIncucyteData(data_file, metric='pc')

test_pm_filtered <-  dplyr::filter(test_pm,
                                   samptype %in% c('C', 'S') & growthcondition == '8 x 10e4/mL')
test_set <- makeIncucyteDRCSet(test_pm_filtered, test_data)

print(test_set)



