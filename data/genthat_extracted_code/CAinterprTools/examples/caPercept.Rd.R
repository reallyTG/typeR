library(CAinterprTools)


### Name: caPercept
### Title: Perceptual map-like Correspondence Analysis scatterplot
### Aliases: caPercept
### Keywords: caPercept

### ** Examples

data(brand_coffee)

caPercept(brand_coffee,1,2,focus="col",dim.corr=1, guide=FALSE)

#In the returned plot, axes are given names according to the major contributing column categories 
# (i.e., coffee brands in this datset), while the points correspond to the row categories 
#(i.e., attributes). Points' size is proportional to the correlation of points with the 1st 
#dimension. If 'guide' is set to TRUE, the returned plot is similar to the preceding one, 
# but the points are given colour according to whether they are more correlated 
# (in relative terms) to the first or to the second of the selected dimensions. 
# In this example, points flagged with "->Dim 1" are more correlated to the 1st dimension, 
# while those flagged with "->Dim 2" have a higher correlation with the 2nd dimension.




