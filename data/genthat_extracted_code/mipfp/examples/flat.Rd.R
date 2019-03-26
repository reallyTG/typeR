library(mipfp)


### Name: flat
### Title: Flatten a table, array or matrix
### Aliases: flat flat.default flat.table flat.array flat.matrix
### Keywords: methods programming

### ** Examples

# loading the data and saving in a 3D-table
data(spnamur, package = "mipfp")
spnamur.sub <- subset(spnamur, select = Household.type:Prof.status)
tab <- table(spnamur.sub)

# flattening the table
tab.flat <- flat(tab)
print(tab.flat)



