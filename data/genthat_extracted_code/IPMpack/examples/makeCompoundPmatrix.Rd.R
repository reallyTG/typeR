library(IPMpack)


### Name: makeCompoundPmatrix
### Title: Builds a compound P matrix.
### Aliases: makeCompoundPmatrix createCompoundPmatrix

### ** Examples

# Data with only continuous stage and two habitats
dff <- generateData()
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size,na.rm = TRUE), 
	maxSize = max(dff$size,na.rm = TRUE), envMatrix = makeEnvObj(dff), 
		growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate), 
			survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate))

image(1:nrow(Pmatrix), 1:ncol(Pmatrix), t(log(Pmatrix)), 
	xlab = "Continuous stage (e.g. size) at t", 
		ylab = "Continuous stage (e.g. size) at t+1", axes = FALSE)
axis(1, at = 1:nrow(Pmatrix), lab = round(rep(Pmatrix@meshpoints,
    Pmatrix@nEnvClass), 2))
axis(2, at = 1:nrow(Pmatrix), lab = round(rep(Pmatrix@meshpoints,
    Pmatrix@nEnvClass), 2))
abline(h = length(Pmatrix@meshpoints) * (1:Pmatrix@nEnvClass))
abline(v = length(Pmatrix@meshpoints) * (1:Pmatrix@nEnvClass))

# Data with continuous and discrete stages
dff <- generateData(type="discrete")
dff$covariate <- sample(1:3, size = nrow(dff), replace = TRUE)
dff$covariateNext <- sample(1:3, size = nrow(dff), replace = TRUE)
discM <- makeDiscreteTrans(dff)
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE), envMatrix = makeEnvObj(dff), 
		growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate), 
			survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate), 
				discreteTrans = discM)



