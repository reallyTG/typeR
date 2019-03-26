library(RMOA)


### Name: datastream_file
### Title: File data stream
### Aliases: datastream_file datastream_table datastream_csv
###   datastream_csv2 datastream_delim datastream_delim2 datastream_table
###   datastream_csv datastream_csv2 datastream_delim datastream_delim2

### ** Examples

mydata <- iris
mydata$Species[2:3] <- NA
## Example of a CSV file stream
myfile <- tempfile()
write.csv(iris, file = myfile, row.names=FALSE, na = "")
x <- datastream_csv(file = myfile, na.strings = "")
x
x$get_points(n=10)
x
x$get_points(n=10)
x
x$stop()

## Create your own specific file stream
write.table(iris, file = myfile, row.names=FALSE, na = "")
x <- datastream_file(description="My file defintion stream", FUN=read.table, 
 file = myfile, header=TRUE, na.strings="")
x$get_points(n=10)
x
x$stop()


## Clean up for CRAN
file.remove(myfile)



