library(tree.bins)


### Name: tree.bins
### Title: Recategorization of Factor Variables by Decision Tree Leaves
### Aliases: tree.bins
### Keywords: factor, relevel rpart,

### ** Examples

#Returns a data.frame of recategorized variables
library(rpart)
sample.df <- AmesImpFctrs[, c("Neighborhood", "MS.Zoning", "SalePrice")]
tree.bins(data = sample.df, y = SalePrice)

#Returns a list of mapping tables generated from tree.bins()
tree.bins(data = sample.df, y = SalePrice, return = "lkup.list")

#Allows the user to choose the naming convention for the attribute naming convention
tree.bins(data = sample.df, y = SalePrice, bin.nm = "bin#")

#Allows user to manually assign a cp to each decision tree evaluated in rpart()
tree.bins(data = sample.df, y = SalePrice, control = rpart.control(cp = .01))

#Allows user to manually assign a cp to specified variables
demo.df <- data.frame(Variables = c("Neighborhood", "MS.Zoning"), CP = c(.001, .2))
tree.bins(data = sample.df, y = SalePrice, control = demo.df)



