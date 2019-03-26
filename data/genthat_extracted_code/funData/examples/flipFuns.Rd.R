library(funData)


### Name: flipFuns
### Title: Flip functional data objects
### Aliases: flipFuns

### ** Examples


### Univariate
argvals <- seq(0,2*pi,0.01)
refData <- funData(argvals, rbind(sin(argvals))) # one observation as reference
newData <- funData(argvals, outer(sample(c(-1,1), 11, replace = TRUE) * seq(0.75, 1.25, by = 0.05),
                               sin(argvals)))

oldpar <- par(no.readonly = TRUE)
par(mfrow = c(1,2))

plot(newData, col = "grey", main = "Original data")
plot(refData, col = "red", lwd = 2, add = TRUE)

plot(flipFuns(refData, newData), col = "grey", main = "Flipped data")
plot(refData, col = "red", lwd = 2, add = TRUE)

### Univariate (irregular)
ind <- replicate(11, sort(sample(1:length(argvals), sample(5:10,1)))) # sample observation points
argvalsIrreg <- lapply(ind, function(i){argvals[i]})
argvalsIrregAll <- unique(sort(unlist(argvalsIrreg)))
 # one observation as reference (fully observed)
refDataFull <- funData(argvals, rbind(sin(argvals)))
 # one observation as reference (irregularly observed)
refDataIrreg <- irregFunData(argvals = list(argvalsIrregAll), X = list(sin(argvalsIrregAll)))
newData <- irregFunData(argvals = argvalsIrreg, X = mapply(function(x, a, s){s * a * sin(x)},
     x = argvalsIrreg, a = seq(0.75, 1.25, by = 0.05), s = sample(c(-1,1), 11, replace = TRUE)))

plot(newData, col = "grey", main = "Original data (regular reference)")
plot(refDataFull, col = "red", lwd = 2, add = TRUE)

plot(flipFuns(refDataFull, newData), col = "grey", main = "Flipped data")
plot(refDataFull, col = "red", lwd = 2, add = TRUE)

plot(newData, col = "grey", main = "Original data (irregular reference)")
plot(refDataIrreg, col = "red", lwd = 2, add = TRUE)

plot(flipFuns(refDataIrreg, newData), col = "grey", main = "Flipped data")
plot(refDataIrreg, col = "red", lwd = 2, add = TRUE)

### Multivariate
refData <- multiFunData(funData(argvals, rbind(sin(argvals))), # one observation as reference
                        funData(argvals, rbind(cos(argvals)))) 
sig <- sample(c(-1,1), 11, replace = TRUE) 
newData <- multiFunData(funData(argvals, outer(sig * seq(0.75, 1.25, by = 0.05), sin(argvals))),
                        funData(argvals, outer(sig * seq(0.75, 1.25, by = 0.05), cos(argvals))))
                        
par(mfrow = c(2,2))

plot(newData[[1]], col = topo.colors(11), main = "Original data")
plot(refData[[1]], col = "red", lwd = 2, add = TRUE)

plot(newData[[2]], col = topo.colors(11), main = "Original data")
plot(refData[[2]], col = "red", lwd = 2, add = TRUE)

plot(flipFuns(refData, newData)[[1]], col = topo.colors(11), main = "Flipped data")
plot(refData[[1]], col = "red", lwd = 2, add = TRUE)

plot(flipFuns(refData, newData)[[2]], col = topo.colors(11), main = "Flipped data")
plot(refData[[2]], col = "red", lwd = 2, add = TRUE)

par(oldpar)



