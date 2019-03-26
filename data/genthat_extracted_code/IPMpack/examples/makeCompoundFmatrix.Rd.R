library(IPMpack)


### Name: makeCompoundFmatrix
### Title: Builds a compound F matrix.
### Aliases: makeCompoundFmatrix createCompoundFmatrix

### ** Examples

# Data with only continuous stage and two habitats
dff <- generateData()
dff$fec[dff$fec==0] <- NA
Fmatrix <-makeCompoundFmatrix(nBigMatrix = 20, 
	minSize = min(dff$size, na.rm = TRUE), 
		maxSize = max(dff$size, na.rm=TRUE), 
			envMatrix = makeEnvObj(dff), 
				fecObj = makeFecObj(dff, Formula = fec~size+size2+covariate, 
					Transform = "log"))

image(1:nrow(Fmatrix), 1:ncol(Fmatrix), t(log(Fmatrix)), 
	xlab="Continuous state (e.g. size) at t", 
		ylab="Continuous state (e.g. size) at t+1", axes = FALSE)
axis(1, at = 1:nrow(Fmatrix), lab = round(rep(Fmatrix@meshpoints, 
    Fmatrix@nEnvClass), 2))
axis(2,at = 1:nrow(Fmatrix), lab = round(rep(Fmatrix@meshpoints,
    Fmatrix@nEnvClass), 2))
abline(h = length(Fmatrix@meshpoints)*(1:Fmatrix@nEnvClass))
abline(v = length(Fmatrix@meshpoints)*(1:Fmatrix@nEnvClass))

# Data with continuous and discrete stages
dff <- generateData(type="discrete")
dff$fec[dff$fec==0] <- NA
dff$covariate <- sample(1:3, size = nrow(dff), replace = TRUE)
dff$covariateNext <- sample(1:3, size = nrow(dff), replace = TRUE)
fv1 <- makeFecObj(dff, Formula = fec~size, Transform = "log", 
	offspringSplitter=data.frame(continuous = 0.9, dormant = 0.1))
Fmatrix <- makeCompoundFmatrix(minSize = min(dff$size, na.rm=TRUE),
maxSize = max(dff$size, na.rm = TRUE), envMatrix = makeEnvObj(dff), 
    fecObj = fv1)



