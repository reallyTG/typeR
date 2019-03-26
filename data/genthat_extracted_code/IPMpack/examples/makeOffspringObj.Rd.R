library(IPMpack)


### Name: makeOffspringObj
### Title: Function to build offspring objects
### Aliases: makeOffspringObj

### ** Examples

#generate data
dff <- generateData()

#make simple linear regression growth object relating size to size at t+1
off1 <- makeOffspringObj(dataf = dff, Formula = sizeNext~1)

#now specifying parameters and supplying no data
off1 <- makeOffspringObj(Formula = incr ~ size + covariate,coeff=c(1,1,1),sd=1)

##make an Fmatrix with this
dff<-generateData()
dff$fec[dff$fec==0] <- NA

off1 <- makeOffspringObj(dataf = dff, Formula = sizeNext~1)
fv1 <- makeFecObj(dff, Formula = fec~size, Transform = "log", 
    doOffspring=FALSE)
Fmatrix1 <- makeIPMFmatrix(fecObj = fv1, nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), maxSize = max(dff$size,
na.rm = TRUE), correction="constant", offspringObj=off1)

#compare with the other approach (where offspring object is not separate)
fv2 <- makeFecObj(dff, Formula = fec~size, Transform = "log",
	offspringSizeExplanatoryVariables = "1", doOffspring=TRUE)
Fmatrix2 <- makeIPMFmatrix(fecObj = fv2, nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), maxSize = max(dff$size,
na.rm = TRUE), correction="constant", offspringObj=NULL)

par(mfrow=c(1,2))
image(Fmatrix1); image(Fmatrix2)






