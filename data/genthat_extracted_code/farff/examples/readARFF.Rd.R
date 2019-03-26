library(farff)


### Name: readARFF
### Title: Read ARFF file into data.frame.
### Aliases: readARFF

### ** Examples

path = tempfile()
writeARFF(iris, path = path)
d = readARFF(path)



