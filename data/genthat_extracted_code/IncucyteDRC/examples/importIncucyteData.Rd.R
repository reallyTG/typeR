library(IncucyteDRC)


### Name: importIncucyteData
### Title: importIncucyteData
### Aliases: importIncucyteData

### ** Examples

#dataset 1
data_file1 <- system.file(file='extdata/example_data.txt', package='IncucyteDRC')
test_data1 <- importIncucyteData(data_file1, metric='pc')
test_data1
head(test_data1$data)

#dataset 2
data_file2 <- system.file(file='extdata/example_data2.txt', package='IncucyteDRC')
test_data2 <- importIncucyteData(data_file2, metric='pc')



