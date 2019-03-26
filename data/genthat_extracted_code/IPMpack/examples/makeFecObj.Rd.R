library(IPMpack)


### Name: makeFecObj
### Title: Function to build fecundity objects
### Aliases: makeFecObj

### ** Examples

dff <- generateData(type="discrete")
fv1 <- makeFecObj(dff, 
	offspringSplitter = data.frame(continuous = 0.2, seedAge1 = 0.8, 
	seedOld = 0),
	fecByDiscrete = data.frame(dormant = 0, seedAge1 = 4.2, seedOld = 0))

#now without any data, imposing desired coefficients
fv1 <- makeFecObj(Formula=list(Fec~size),
				offspringSplitter = data.frame(continuous = 0.2, dormant=0,
				seedAge1 = 0.8),
				fecByDiscrete = data.frame(dormant = 0, seedAge1 = 4.2), 
				coeff=list(c(1,1)), meanOffspringSize=1,sdOffspringSize=1)
				




