library(idm)


### Name: plot.i_pca
### Title: Plotting 2D maps in Principal Component Analysis
### Aliases: plot.i_pca

### ** Examples

data("iris", package = "datasets")
#standardize variables
X = scale(iris[,-5])
res_iPCA = i_pca(data1 = X[1:50,-5], data2 = X[51:150,-5], nchunk = c(50,50))
#static plot, final solution
plot(res_iPCA, animation = FALSE)
## No test: 
##\donttest is used here because the code calls the saveLatex function of the animation package 
#which requires ImageMagick or GraphicsMagick and 
#Adobe Acrobat Reader to be installed in your system 
#See help(im.convert) for details on the configuration of ImageMagick or GraphicsMagick.
#Creates animated plots in PDF for objects and variables
plot(res_iPCA, animation = TRUE, frames = 10, movie_format = 'pdf')
## End(No test)



