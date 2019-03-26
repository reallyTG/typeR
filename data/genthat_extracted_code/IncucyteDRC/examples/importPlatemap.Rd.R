library(IncucyteDRC)


### Name: importPlatemap
### Title: importPlatemap
### Aliases: importPlatemap

### ** Examples

pm_file <- system.file(file='extdata/example_platemap.txt', package='IncucyteDRC')
test_pm <- importPlatemap(pm_file)
head(test_pm)
test_pm_df <- importPlatemap(as.data.frame(test_pm))
head(test_pm_df)



