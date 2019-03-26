library(idm)


### Name: plot.i_mca
### Title: Plotting 2D maps in Multiple Correspondence Analysis
### Aliases: plot.i_mca

### ** Examples

data("women", package = "idm")
res_iMCAl = i_mca(data1 = women[1:50, 1:4], data2 = women[51:300, 1:4], 
method = "live", nchunk = 4)
#static plot, final solution
plot(res_iMCAl, contrib = "ctr", animation = FALSE)
## No test: 
#\donttest is used here because the code calls the saveLatex function of the animation package 
#which requires ImageMagick or GraphicsMagick and 
#Adobe Acrobat Reader to be installed in your system 
#See help(im.convert) for details on the configuration of ImageMagick or GraphicsMagick.
#Creates animated plots in PDF for objects and variables
plot(res_iMCAl, contrib = "ctr", animation = TRUE, frames = 10, movie_format = 'pdf')
## End(No test)



