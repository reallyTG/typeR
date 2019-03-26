library(GEOmap)


### Name: XSECDEMg
### Title: Cross Sections Using RPMG
### Aliases: XSECDEMg
### Keywords: iplot

### ** Examples

data(volcano)
attr(volcano, 'dx') =10
attr(volcano, 'dy') =10
mybutts = c("DONE", "REFRESH", "rainbow", "topo", "terrain", "CONT",
"XSEC","PS" )
###  in the following change demo=FALSE to get interactive behavior
XSECDEMg(volcano, mybutts, demo=TRUE)






