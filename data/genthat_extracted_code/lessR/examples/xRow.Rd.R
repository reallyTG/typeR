library(lessR)


### Name: xRow
### Title: Text Processing: Add the Word Row to Case Labels that Could be
###   Numeric
### Aliases: xRow

### ** Examples

# The word Row gets added
v <- c(2, 4, 6)
names(v) <- c("1", "2", "3")
xRow(v)

# The word Row does not get added
v <- c(2, 4, 6)
names(v) <- c("Bill", "Tulane", "Hanna")
xRow(v)



