library(PKPDmisc)


### Name: as_numeric
### Title: convert to numeric passing through character for safety
### Aliases: as_numeric

### ** Examples

# factor with weird levels that we don't want to keep
ex <- factor(c(1, 2, 3, 4), levels = c(2, 3, 1, 4)) 
ex

# keeps information about the levels, oh no!
as.numeric(ex) 

# keeps the labelled values
as_numeric(ex)



