library(RPMG)


### Name: XSECDEM
### Title: Cross Sections Using RPMG
### Aliases: XSECDEM
### Keywords: iplot

### ** Examples

data(volcano)
attr(volcano, 'dx') =10
attr(volcano, 'dy') =10
mybutts = c("DONE", "REFRESH", "rainbow", "topo", "terrain", "CONT",
"XSEC","PS" )
###  in the following change demo=FALSE to get interactive behavior
XSECDEM(volcano, mybutts, demo=TRUE)






