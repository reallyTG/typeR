library(forestmangr)


### Name: average_tree_curve
### Title: Generate the curve of a forest's average tree using the Kozak
###   taper model
### Aliases: average_tree_curve

### ** Examples

library(forestmangr)
data("exfm7")
exfm7

# Get the data's average tree curve inserting the section diameter and height, total height
# and dbh variables: 
average_tree_curve(df = exfm7, d = "di_wb", dbh = "DBH", h = "hi", th = "TH")

# It's possible to get the average tree curve of each strata with the facet argument:
average_tree_curve(df = exfm7, d = "di_wb", dbh = "DBH", h = "hi", th = "TH", facet = "STRATA")




