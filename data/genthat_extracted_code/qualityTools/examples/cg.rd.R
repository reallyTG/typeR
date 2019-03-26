library(qualityTools)


### Name: cg
### Title: Function to calculate and visualize the gage capability.
### Aliases: cg cgToleranceView cgHist cgRunChart
### Keywords: Gage Capability Six Sigma

### ** Examples
            
#simple example with default values                                
cg(rnorm(125,mean = 10.01 ,sd = 0.1), target = 10, tolerance = c(8,12)) 
#example with larger n and adjusted ref. interval                   
cg(rnorm(25,mean = 1.01 ,sd = 0.5), ref.interval=pnorm(5.5/2)-pnorm(-5.5/2), n=0.3)     
#example with changed factors for Cg and Cgk   
cg(rnorm(75, sd = 0.1), facCg = 0.15, facCgk = 0.075, tolerance = c(-10,10)/6)             



