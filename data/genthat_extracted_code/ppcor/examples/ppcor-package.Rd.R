library(ppcor)


### Name: ppcor-package
### Title: Partial and Semi-partial (Part) Correlation
### Aliases: ppcor-package ppcor
### Keywords: htest

### ** Examples

# data
y.data <- data.frame(
				hl=c(7,15,19,15,21,22,57,15,20,18),
				disp=c(0.000,0.964,0.000,0.000,0.921,0.000,0.000,1.006,0.000,1.011),
				deg=c(9,2,3,4,1,3,1,3,6,1),
				BC=c(1.78e-02,1.05e-06,1.37e-05,7.18e-03,0.00e+00,0.00e+00,0.00e+00
              ,4.48e-03,2.10e-06,0.00e+00)
			)
# partial correlation
pcor(y.data) 

# partial correlation between "hl" and "disp" given "deg" and "BC"
pcor.test(y.data$hl,y.data$disp,y.data[,c("deg","BC")])
pcor.test(y.data[,1],y.data[,2],y.data[,c(3:4)])
pcor.test(y.data[,1],y.data[,2],y.data[,-c(1:2)])

# semi-partial (part) correlation
spcor(y.data) 

# semi-partial (part) correlation between "hl" and "disp" given "deg" and "BC"
spcor.test(y.data$hl,y.data$disp,y.data[,c("deg","BC")])
spcor.test(y.data[,1],y.data[,2],y.data[,c(3:4)])
spcor.test(y.data[,1],y.data[,2],y.data[,-c(1:2)])



