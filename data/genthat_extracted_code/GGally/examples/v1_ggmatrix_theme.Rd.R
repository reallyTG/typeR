library(GGally)


### Name: v1_ggmatrix_theme
### Title: Modify a ggmatrix object by adding an ggplot2 object to all
###   plots
### Aliases: v1_ggmatrix_theme

### ** Examples


ggpairs(iris, 1:2) + v1_ggmatrix_theme()
# move the column names to the left and bottom
ggpairs(iris, 1:2, switch = "both") + v1_ggmatrix_theme()



