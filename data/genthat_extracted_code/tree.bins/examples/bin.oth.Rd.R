library(tree.bins)


### Name: bin.oth
### Title: Recategorization of Variables by Mapping Tables Within a List
### Aliases: bin.oth
### Keywords: factor relevel rpart

### ** Examples

#Allows the user to generate a list from the tree.bins() function
sample.df <- AmesImpFctrs[, c("Neighborhood", "MS.Zoning", "SalePrice")]
lookup.list <- tree.bins(data = sample.df, y = SalePrice, return = "lkup.list")

#Create a new data.frame and use the created list to map recategorize its values
new.df <- head(AmesImpFctrs[, c("Neighborhood", "MS.Zoning", "Lot.Shape", "SalePrice")], 100)
oth.binned.df <- bin.oth(list = lookup.list, data = new.df)



