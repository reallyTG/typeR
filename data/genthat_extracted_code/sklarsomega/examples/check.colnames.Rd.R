library(sklarsomega)


### Name: check.colnames
### Title: Check the column names of a Sklar's Omega data matrix for
###   correctness.
### Aliases: check.colnames

### ** Examples

# The following data were presented in Krippendorff (2013).

data = matrix(c(1,2,3,3,2,1,4,1,2,NA,NA,NA,
                1,2,3,3,2,2,4,1,2,5,NA,3,
                NA,3,3,3,2,3,4,2,2,5,1,NA,
                1,2,3,3,2,4,4,1,2,5,1,NA), 12, 4)
colnames(data) = c("c.1.1", "c.2.1", "c.3.1", "c.4.1")
data
(check.colnames(data))

# Introduce errors for columns 1 and 4.

colnames(data) = c("c.a.1", "c.2.1", "c.3.1", "C.4.1")
(check.colnames(data))

# The following scenario passes the check but is illogical.

colnames(data) = c("g", "c.2.1", "c.1.47", "c.2.1")
(check.colnames(data))



