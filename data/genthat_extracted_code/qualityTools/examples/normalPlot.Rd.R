library(qualityTools)


### Name: normalPlot
### Title: Normal plot
### Aliases: normalPlot
### Keywords: Design of Experiments Six Sigma

### ** Examples

#factorial design
fdo = facDesign(k=3, replicates = 2)  
#seed for random numbers
set.seed(123) 
#random numbers
y = rnorm(nrow(fdo)) 
#set the response 
response(fdo) = y 
#create a normal plot
normalPlot(fdo) 



