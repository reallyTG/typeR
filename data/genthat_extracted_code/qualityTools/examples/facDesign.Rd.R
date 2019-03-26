library(qualityTools)


### Name: facDesign
### Title: facDesign
### Aliases: facDesign
### Keywords: Design of Experiments Six Sigma

### ** Examples

#returns a 2^3 full factorial design
vp.full = facDesign(k = 3)        
#generate some random response                        
response(vp.full) = rnorm(2^3) 
#summary of the full factorial design (especially no defining relation)                            
summary(vp.full)                                           

#------------

#returns a full factorial design with 3 replications per factor combination 
#and 4 center points
vp.rep = facDesign(k = 2, replicates = 3, centerCube = 4)  
#set names
names(vp.rep) = c("Name 1", "Name 2") 
#set units                     
units(vp.rep) = c("min", "F")         
#set low and high factor values                     
lows(vp.rep) = c(20, 40, 60)                               
highs(vp.rep) = c(40, 60, 80)  
#summary of the replicated full factorial Design        
summary(vp.rep)                                                



