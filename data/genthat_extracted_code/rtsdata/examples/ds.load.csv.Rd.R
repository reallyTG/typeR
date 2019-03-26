library(rtsdata)


### Name: ds.load.csv
### Title: Read csv
### Aliases: ds.load.csv

### ** Examples

 # generate csv file
 filename = file.path(tempdir(), 'dummy.csv')
 cat('x1,x2,x3\n1,2,3\n', file = filename)
 ds.load.csv(filename)
 



