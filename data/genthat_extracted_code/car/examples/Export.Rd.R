library(car)


### Name: Export
### Title: Export a data frame to disk in one of many formats
### Aliases: Export
### Keywords: utilities connections

### ** Examples

Export(Duncan, "Duncan.csv", keep.row.names="occupation")
Duncan2 <- Import("Duncan.csv") # Automatically restores row.names
identical(Duncan, Duncan2)
# cleanup
unlink("Duncan.csv")



