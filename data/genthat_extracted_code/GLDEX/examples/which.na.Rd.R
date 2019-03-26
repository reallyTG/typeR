library(GLDEX)


### Name: which.na
### Title: Determine Missing Values
### Aliases: which.na
### Keywords: manip

### ** Examples

# A non-zero number divided by zero creates infinity,
# zero over zero creates a NaN 
weird.values <- c(1/0, -2.9/0, 0/0, NA) 
which.na(weird.values) 
# Produces:
#  [1] 3 4 



