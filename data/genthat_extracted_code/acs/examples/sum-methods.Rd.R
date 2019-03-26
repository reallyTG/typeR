library(acs)


### Name: sum-methods
### Title: acs Methods for Function 'sum'
### Aliases: sum sum-methods sum,acs-method sum,acs,acs-method
### Keywords: methods

### ** Examples


# load ACS data
data(kansas09)

# aggregate the third column, all rows
sum(kansas09[,3])

# aggregate the fifth row, all column
sum(kansas09[5,])

# aggregate all rows, columns 3 through 25, rename rows "Kansas" and columns "Total Males"
sum(kansas09[, 3:25], agg.term=c("Kansas","Total Males"))



