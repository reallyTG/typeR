library(FMP)


### Name: gen4PMData
### Title: Generate item response data for 1, 2, 3, or 4-parameter IRT
###   models
### Aliases: gen4PMData
### Keywords: statistics

### ** Examples


## Generate simulated 4PM data for 2,000 subjects
# 4PM Item parameters from MMPI-A CYN scale

Params<-matrix(c(1.41, -0.79, .01, .98, #1  
                 1.19, -0.81, .02, .96, #2 
                 0.79, -1.11, .05, .94, #3
                 0.94, -0.53, .02, .93, #4
                 0.90, -1.02, .04, .95, #5
                 1.00, -0.21, .02, .84, #6
                 1.05, -0.27, .02, .97, #7
                 0.90, -0.75, .04, .73, #8  
                 0.80, -1.42, .06, .98, #9
                 0.71,  0.13, .05, .94, #10
                 1.01, -0.14, .02, .81, #11
                 0.63,  0.18, .18, .97, #12
                 0.68,  0.18, .02, .87, #13
                 0.60, -0.14, .09, .96, #14
                 0.85, -0.71, .04, .99, #15
                 0.83, -0.07, .05, .97, #16
                 0.86, -0.36, .03, .95, #17
                 0.66, -0.64, .04, .77, #18
                 0.60,  0.52, .04, .94, #19
                 0.90, -0.06, .02, .96, #20
                 0.62, -0.47, .05, .86, #21
                 0.57,  0.13, .06, .93, #22
                 0.77, -0.43, .04, .97),23,4, byrow=TRUE) 

 data <- gen4PMData(NSubj=2000, abcdParams = Params, D = 1.702,  
                    seed = 123, thetaMN = 0, thetaVar = 1)$data
 
 cat("\nClassical item difficulties for simulated data")                   
 print( round( apply(data,2,mean),2) )



