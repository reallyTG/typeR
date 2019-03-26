library(NCmisc)


### Name: Mode
### Title: Find the mode of a vector.
### Aliases: Mode

### ** Examples

Mode(c(1,2,3,3,4,4)) # 2 values are most common, as multi=FALSE, 
# selects the last value (after sort)
Mode(c(1,2,3,3,4,4),multi=TRUE) # same test with multi=T, 
# returns both most frequent
Mode(matrix(1:16,ncol=4),warn=TRUE) # takes mode of the entire
# matrix treating as a vector, but all values occur once
Mode(c("Tom","Dick","Harry"),multi=FALSE,warn=TRUE) # selects last
# sorted value, but warns there are multiple modes
Mode(c("Tom","Dick","Harry"),multi=TRUE,warn=TRUE) # multi==TRUE so
# warning is negated



