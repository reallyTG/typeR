library(idm)


### Name: i_pca
### Title: Incremental Principal Component Analysis (PCA)
### Aliases: i_pca

### ** Examples

data("segmentationData", package = "caret")
#center and standardize variables, keep 58 continuous attributes
HCS = data.frame(scale(segmentationData[,-c(1:3)]))
#abbreviate variable names for plotting
names(HCS) = abbreviate(names(HCS), minlength = 5)
#split the data into starting data and incoming data
data1 = HCS[1:150, ]
data2 = HCS[151:2019, ]
#Incremental PCA on the HCS data set: the incoming data is 
#splitted into twenty chunks; the first 5 components/dimensions 
#are computed in each update
res_iPCA = i_pca(data1, data2, current_rank = 5, nchunk = 20)
#Static plots 
plot(res_iPCA, animation = FALSE)
## No test: 
#\donttest is used here because the code calls the saveLatex function of the animation package 
#which requires ImageMagick or GraphicsMagick and 
#Adobe Acrobat Reader to be installed in your system 
#See help(im.convert) for details on the configuration of ImageMagick or GraphicsMagick.
#Creates animated plot in PDF for objects and variables
plot(res_iPCA, animation = TRUE, frames = 10, movie_format = 'pdf')
## End(No test)

#Daily Closing Prices of Major European Stock Indices, 1991-1998 
data("EuStockMarkets", package = "datasets") 
res_iPCA = i_pca(data1 = EuStockMarkets[1:50,], data2 = EuStockMarkets[51:1860,], nchunk = 5) 
## No test: 
#\donttest is used here because the code calls the saveLatex function of the animation package 
#which requires ImageMagick or GraphicsMagick and 
#Adobe Acrobat Reader to be installed in your system 
#See help(im.convert) for details on the configuration of ImageMagick or GraphicsMagick.
#Creates animated plot in PDF movies for objects and variables
plot(res_iPCA, animation = TRUE, frames = 10, movie_format = 'pdf')
## End(No test)



