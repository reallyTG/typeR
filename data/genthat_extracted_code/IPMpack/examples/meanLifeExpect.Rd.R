library(IPMpack)


### Name: meanLifeExpect
### Title: Calculates the mean life expectancy.
### Aliases: meanLifeExpect
### Keywords: ~kwd1

### ** Examples

# With a single continuous state variable (e.g. size):
dff <- generateData()
Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj=makeGrowthObj(dff),
survObj = makeSurvObj(dff))
meanLifeExpect(Pmatrix)

Pmatrix <- makeIPMPmatrix(minSize = min(dff$size, na.rm = TRUE),
maxSize = max(dff$size, na.rm = TRUE), growObj = makeGrowthObj(dff),
survObj = makeSurvObj(dff))

plot(meanLifeExpect(Pmatrix), ylab = "Mean life expectancy", 
xlab = "Continuous (e.g. size) stage", type = "l", col="dark gray", 
ylim = c(0,max(meanLifeExpect(Pmatrix))))

# With continuous (e.g. size) and discrete (e.g. seedbank) stages:
dff <- generateData(type="discrete")
dff$covariate <- sample(1:3, size = nrow(dff), replace = TRUE)
dff$covariateNext <- sample(1:3, size = nrow(dff), replace = TRUE)
discM <- makeDiscreteTrans(dff)
Pmatrix <- makeCompoundPmatrix(minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE), envMatrix = makeEnvObj(dff),
growObj = makeGrowthObj(dff, Formula = sizeNext~size+size2+covariate),
survObj = makeSurvObj(dff, Formula = surv~size+size2+covariate), 
discreteTrans = discM)
mLE <- meanLifeExpect(Pmatrix)

# showing three environments on different panels, 
# life expectancy of discrete stages
# shown at level of the first size class
par(mfrow=c(max(Pmatrix@env.index),1))

xvals <- c(rep(Pmatrix@meshpoints[1],ncol(discM@discreteTrans)-1),
    Pmatrix@meshpoints)

for (k in 1:max(Pmatrix@env.index)) { 
	indx <- ((k-1)*(ncol(discM@discreteTrans)-1+length(Pmatrix@meshpoints))+1):
		(k*(ncol(discM@discreteTrans)-1+length(Pmatrix@meshpoints)))
	
	plot(xvals,mLE[indx], 
		ylab = "Mean life expectancy", 
		xlab = "Continuous (e.g. size) and discrete (e.g. seedbank) stages", 
		type = "l", col = "dark gray", ylim = c(0,max(mLE)), 
		main=paste("habitat ",k,sep=""))	
	}



