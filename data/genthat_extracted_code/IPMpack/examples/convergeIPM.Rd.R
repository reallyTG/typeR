library(IPMpack)


### Name: convergeIPM
### Title: Iterates until obtaining the number of bins required so that the
###   difference in the chosen measure (lambda, R0, life expectancy of a
###   chosenBin) falls below a chosen tolerance level
### Aliases: convergeIPM

### ** Examples

dff<-generateData()
gr1<-makeGrowthObj(dff)
sv1<-makeSurvObj(dff)
fv1<-makeFecObj(dff,Transform="log")

res <- convergeIPM(growObj=gr1, 
 survObj=sv1, fecObj=fv1, 
 nBigMatrix=10, minSize=-2,
 maxSize=15,discreteTrans = 1, 
 integrateType = "midpoint", 
 correction = "none", 
 preCensus = TRUE, tol=1e-3,binIncrease=10)

res <- convergeIPM(growObj=gr1, 
survObj=sv1, fecObj=fv1, 
 nBigMatrix=10, minSize=-2,
 maxSize=15,discreteTrans = 1, 
 integrateType = "midpoint", 
 correction = "none", 
 preCensus = TRUE, tol=1e-3,
 binIncrease=10, response="R0")

res <- convergeIPM(growObj=gr1, survObj=sv1, fecObj=fv1, 
 nBigMatrix=10, minSize=-2,
 maxSize=15,discreteTrans = 1, 
 integrateType = "midpoint", 
 correction = "none", 
 preCensus = TRUE, tol=1e-3,binIncrease=10, 
 response="lifeExpect")






