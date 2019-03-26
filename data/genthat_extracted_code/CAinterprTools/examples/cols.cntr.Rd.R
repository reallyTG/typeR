library(CAinterprTools)


### Name: cols.cntr
### Title: Columns contribution chart
### Aliases: cols.cntr
### Keywords: cols.cntr

### ** Examples

data(greenacre_data)

# Plots the contribution of the column
#categories to the 2nd CA dimension, and also displays the contribution to the total inertia.
#The categories are sorted in descending order of contribution
#to the inertia of the selected dimension.
cols.cntr(greenacre_data, 2, categ.sort=TRUE)




