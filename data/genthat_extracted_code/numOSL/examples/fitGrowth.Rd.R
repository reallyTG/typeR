library(numOSL)


### Name: fitGrowth
### Title: Growth curve fitting
### Aliases: fitGrowth fitGrowth.default
### Keywords: growth curve

### ** Examples

 ### Example 1:
 Curvedata <- cbind(c(0, 18, 36, 54, 72, 0, 18),               
                    c(0.026, 1.55, 2.39, 3.46, 4.13, 0.023, 1.61),  
                    c(0.005, 0.11, 0.27, 0.22, 0.20, 0.008, 0.24)) 
 fitGrowth(Curvedata, model="gok", origin=FALSE, plot=TRUE)

 ### Example 2 (not run):
 # data(SARdata)
 # Curvedata <- SARdata[!is.element(SARdata[,2], "N"),3:5]
 # fitGrowth(Curvedata, model="gok", origin=FALSE)
 



