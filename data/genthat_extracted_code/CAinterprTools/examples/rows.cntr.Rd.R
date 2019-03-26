library(CAinterprTools)


### Name: rows.cntr
### Title: Rows contribution chart
### Aliases: rows.cntr
### Keywords: rows.cntr

### ** Examples

data(greenacre_data)

#Plots the contribution of the row categories to the 2nd CA dimension,
#and also displays the contribnution to the total inertia.
#The categories are sorted in descending order of contribution to the inertia
#of the selected dimension.
rows.cntr(greenacre_data, 2, categ.sort=TRUE)




