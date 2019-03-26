library(CAinterprTools)


### Name: caPlot
### Title: Intepretation-oriented Correspondence Analysis scatterplots,
###   with informative and flexible (non-overlapping) labels.
### Aliases: caPlot
### Keywords: caPlot

### ** Examples

data(brand_coffee)

#displays a 'regular' (symmetric) CA scatterplot, with row and column categories displayed in the 
#same space, and with points' labels just reporting the categories' names. 
#Relevant information (see description above) are stored in the variable 'res'.
res <- caPlot(brand_coffee,1,2,adv.labls=FALSE)

#displays the CA scatterplot, with the columns' labels indicating which category 
# has a major contribution to the definition of the selected dimensions. 
# Rows' labels report the correlation (i.e., sqrt(COS2)) with the selected dimensions.
res <- caPlot(brand_coffee,1,2,cntr="columns")


#displays the CA scatterplot, with the rows' labels indicating 
#which category has a major contribution to the definition of the selected dimensions. 
#Columns' labels report the correlation (i.e., sqrt(COS2)) with the selected dimensions.
res <- caPlot(brand_coffee,1,2,cntr="rows")


#displays the CA scatterplot as a perceptual map; 
#the poles of the selected dimensions will be given names according 
#to the column categories that have a major contribution to the definition 
#of the selected dimensions. Rows' labels report the correlation (i.e., sqrt(COS2)) 
#with the selected dimensions.
res <- caPlot(brand_coffee,1,2,cntr="columns", percept=TRUE)




