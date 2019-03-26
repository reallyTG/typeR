library(CAinterprTools)


### Name: rescale
### Title: Rescaling row/column categories coordinates between a minimum
###   and maximum value
### Aliases: rescale
### Keywords: rescale

### ** Examples

data(greenacre_data)

#rescale the row coordinates between 0 and 10
res <- rescale(greenacre_data, which="rows", min.v=0, max.v=10)




