library(IPMpack)


### Name: sensParams
### Title: Estimates sensitivity and elasticity of lambda (or R0, or Life
###   expectancy of a chosen bin) to parameters underlying an IPM.
### Aliases: sensParams

### ** Examples

dff <- generateData()

#lambda
res <- sensParams(growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), fecObj = makeFecObj(dff, Transform="log"), 
nBigMatrix = 50, minSize = min(dff$size, na.rm=TRUE), 
maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate "* lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate "* lambda), 
las = 2, cex.names = 0.5) 

#R0
resR0 <- sensParams(growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff), fecObj = makeFecObj(dff, Transform="log"), 
nBigMatrix = 50, minSize = min(dff$size, na.rm=TRUE), 
maxSize = max(dff$size, na.rm = TRUE), response="R0")

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(resR0$sens, 
main = expression("Parameter sensitivity of net reproductive rate R"[0]), 
las = 2, cex.names = 0.5) 
barplot(resR0$elas, 
main = expression("Parameter elasticity of net reproductive rate R"[0]), 
las = 2, cex.names = 0.5) 

#life expectancy
resLE <- sensParams(growObj = makeGrowthObj(dff), 
survObj = makeSurvObj(dff),  nBigMatrix = 50, 
minSize = min(dff$size, na.rm=TRUE), maxSize = max(dff$size, na.rm =
TRUE), chosenBin=1, response="lifeExpect")

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(resLE$sens, 
main = expression("Parameter sensitivity of Life Expectancy"*eta[0]), 
las = 2, cex.names = 0.5) 
barplot(resLE$elas, 
main = expression("Parameter elasticity of Life expectancy"*eta[0]), 
las = 2, cex.names = 0.5) 

# Same as lambda above, but with two fecundity functions
dff$fec2 <- dff$fec>0 #create binomial describing e.g., prob of flowering
dff$fec[dff$fec==0] <- NA #take out zeros to avoid Inf when fit with log
fv1 <- makeFecObj(dff, Formula = c(fec~size+size2,fec2~size), 
    Transform=c("log","none"),Family = c("gaussian","binomial"))

res <- sensParams(growObj=makeGrowthObj(dff), survObj = makeSurvObj(dff), 
fecObj = fv1, nBigMatrix = 50, minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 

# Same but with two fecundity functions and a constant
fv1@fecConstants[1] <-0.5
res <- sensParams(growObj = makeGrowthObj(dff), survObj = makeSurvObj(dff), 
fecObj = fv1, nBigMatrix = 50, minSize = min(dff$size, na.rm = TRUE), 
maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate " *lambda), 
las = 2, cex.names = 0.5)

# Same but with a discrete class
dff <- generateData(type="discrete")
res <- sensParams(growObj = makeGrowthObj(dff), survObj = makeSurvObj(dff), 
	fecObj = makeFecObj(dff), discreteTrans=makeDiscreteTrans(dff),
	nBigMatrix = 50, minSize = min(dff$size, na.rm = TRUE), 
	maxSize = max(dff$size, na.rm = TRUE))

par(mfrow = c(2, 1), bty = "l", pty = "m") 
barplot(res$sens, 
main = expression("Parameter sensitivity of population growth rate " *lambda), 
las = 2, cex.names = 0.5) 
barplot(res$elas, 
main = expression("Parameter elasticity of population growth rate " *lambda), 
las = 2, cex.names = 0.5)




