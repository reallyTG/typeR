library(idm)


### Name: i_mca
### Title: Incremental Multiple Correspondence Analysis (MCA)
### Aliases: i_mca

### ** Examples

##Example 1 - Exact case
data("women", package = "idm")
nc = 5 # number of chunks
res_iMCAh = i_mca(data1 = women[1:300,1:7], data2 = women[301:2107,1:7]
,method = "exact", nchunk = nc)
#static MCA plot of attributes on axes 2 and 3
plot(x = res_iMCAh, dim = c(2,3), what = c(FALSE,TRUE), animation = FALSE)
## No test: 
#\donttest is used here because the code calls the saveLatex function of the animation package 
#which requires ImageMagick or GraphicsMagick and 
#Adobe Acrobat Reader to be installed in your system 
#Creates animated plot in PDF for objects and variables
plot(res_iMCAh, animation = TRUE, frames = 10, movie_format = 'pdf')
## End(No test)

##Example 2 - Live case
data("tweet", package = "idm")
nc = 5
#provide attributes with custom labels
labels = c("HLTN", "ICN", "MRT","BWN","SWD","HYT","CH", "-", "-/+", "+", "++", "Low", "Med","High")
#mimics the 'live' MCA implementation 
res_iMCAl = i_mca(data1 = tweet[1:100,], data2 = tweet[101:1000,],
method="live", nchunk = nc, current_rank = 2)

## No test: 
#\donttest is used here because the code calls the saveLatex function of the animation package 
#which requires ImageMagick or GraphicsMagick and 
#Adobe Acrobat Reader to be installed in your system 
#See help(im.convert) for details on the configuration of ImageMagick or GraphicsMagick.
#Creates animated plot in PDF for observations and variables
plot(res_iMCAl, labels = labels, animation = TRUE, frames = 10, movie_format = 'pdf')
## End(No test)



