library(OasisR)


### Name: segdataclean
### Title: A function to clean and prepare the data for segregation
###   analysis
### Aliases: segdataclean

### ** Examples

x <- segdata@data[ ,1:2]
x[ ,3] <- rep (0 ,100)
x[1:3, ] <- rep (c(0, 0, 0), 3)
x1 <- x
spatobj <- segdata
cldata <- segdataclean(x1, segdata)
x1 <- cldata$x
spatobj <- cldata$spatobj

c <- contig (segdata)
c <- segdataclean(x, c = c)$c




