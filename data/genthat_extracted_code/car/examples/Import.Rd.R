library(car)


### Name: Import
### Title: Import data from many file formats
### Aliases: Import
### Keywords: utilities connections

### ** Examples

head(Duncan, 3) # first three rows
Export(Duncan, "Duncan.csv", keep.row.names="occupation")
Duncan2 <- Import("Duncan.csv") # Automatically restores row.names and factors
head(Duncan2, 3) # first three rows
identical(Duncan, Duncan2)
# cleanup
unlink("Duncan.csv")



