library(IPMpack)


### Name: makeGrowthObj
### Title: Function to build growth objects
### Aliases: makeGrowthObj

### ** Examples

#generate data
dff <- generateData()
#make simple linear regression growth object relating size to size at t+1
(gr1 <- makeGrowthObj(dataf = dff, Formula = sizeNext~size))
#same but relating size to incr
(gr1 <- makeGrowthObj(dataf = dff, Formula = incr ~ size))

#assess fit 
picGrow(dff,gr1)

#same but relating size to incr and discrete covariate
(gr1 <- makeGrowthObj(dataf = dff, Formula = incr ~ size + covariate, 
	regType = "changingVar"))
#with declining increment
(gr1 <- makeGrowthObj(dataf = dff, Formula = incr ~ size + covariate, 
	regType = "changingVar"))

#now specifying parameters and supplying no data
gr1 <- makeGrowthObj(Formula = incr ~ size + covariate,coeff=c(1,1,1),sd=1)






