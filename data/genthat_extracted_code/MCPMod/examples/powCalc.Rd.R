library(MCPMod)


### Name: powCalc
### Title: Calculate the power for the multiple contrast test
### Aliases: powCalc
### Keywords: design

### ** Examples

doses <- c(0,10,25,50,100,150)
models <- list(linear = NULL, emax = c(25),
               logistic = c(50, 10.88111), exponential=c(85),
               betaMod=matrix(c(0.33,2.31,1.39,1.39), byrow=TRUE, nrow=2))

# calculate optimal contrasts and critical value 
plMM <- planMM(models, doses, 50, scal = 200, alpha = 0.05)

# calculate mean vectors
compMod <- fullMod(models, doses, base = 0, maxEff = 0.4, scal = 200)
muMat <- modelMeans(compMod, doses, FALSE, scal = 200)

# calculate power to detect mean vectors
# Power for linear model 
powCalc(plMM$contMat, 50, mu = muMat[,1], sigma = 1, cVal = plMM$critVal)
# Power for emax model  
powCalc(plMM$contMat, 50, mu = muMat[,2], sigma = 1, cVal = plMM$critVal)
# Power for logistic model
powCalc(plMM$contMat, 50, mu = muMat[,3], sigma = 1, cVal = plMM$critVal)
# compare with JBS 16, p. 650



