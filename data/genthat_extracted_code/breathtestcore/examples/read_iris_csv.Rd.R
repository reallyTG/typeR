library(breathtestcore)


### Name: read_iris_csv
### Title: Read 13C data from IRIS/Wagner Analysen in CSV Format
### Aliases: read_iris_csv

### ** Examples

filename = btcore_file("IrisCSV.TXT")
cat(readLines(filename, n = 3), sep="\n")
#
iris_data = read_iris_csv(filename)
str(iris_data)



