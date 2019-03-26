library(wmtsa)


### Name: wavCWTTree
### Title: Tree map of continuous wavelet transform extrema
### Aliases: wavCWTTree [.wavCWTTree plot.wavCWTTree
###   print.summary.wavCWTTree print.wavCWTTree summary.wavCWTTree
### Keywords: univar models nonlinear

### ** Examples

## create linchirp series 
linchirp <- make.signal("linchirp")

## calculate the CWT 
W <- wavCWT(linchirp)

## form CWT tree 
W.tree <- wavCWTTree(W)

## print the object 
print(W.tree)

## summarize the object 
summary(W.tree)

## plot thea CWT image with a tree overlay 
## (R-only) 
plot(W)
if (is.R()) plot(W.tree, extrema=TRUE, add=TRUE)

## plot all CWT tree branches 
plot(W.tree)

## plot a subset of CWT tree branches 
plot(W.tree[5:10])

## plot an illustration of the Holder exponent 
## estimation process. select branches between 
## times 0.2 and 0.4 (only the first four found 
## will be fitted) 
plot(W.tree[range=c(0.2, 0.4)], fit=TRUE)



