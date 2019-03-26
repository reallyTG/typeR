library(CAinterprTools)


### Name: caScatter
### Title: Scatterplot visualization facility
### Aliases: caScatter
### Keywords: caScatter

### ** Examples

data(greenacre_data)

# symmetric scatterplot for rows and columns
caScatter(greenacre_data, 1, 2, type=1) 

# Standard Biplot; 2 plots are returned:
#one with row-categories vectors displayed, one for columns categories vectors.
caScatter(greenacre_data, 1, 2, type=2) 

# scaterplot of row categories with groupings
#shown by different colors; scatterplot for column categories is also returned
caScatter(greenacre_data, 1, 2, type=3) 

# 3D scatterplot with cluster tree for row categories;
#scatterplot for column categories is also returned.
caScatter(greenacre_data, 1, 2, type=4) 




