library(breathtestcore)


### Name: read_iris
### Title: Read 13C data from IRIS/Wagner Analysen
### Aliases: read_iris

### ** Examples

filename = btcore_file("IrisMulti.TXT")
cat(readLines(filename, n = 10), sep="\n")
#
iris_data = read_iris(filename)
str(iris_data)



