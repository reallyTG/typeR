library(qualityTools)


### Name: fracDesign
### Title: fracDesign
### Aliases: fracDesign
### Keywords: Design of Experiments Six Sigma

### ** Examples

#returns a 2^3 full factorial design
vp.full = facDesign(k = 3)       
#design in 2 blocks                           
vp.full = blocking(vp.full, 2)   
#generate some random response                           
response(vp.full) = rnorm(2^3)   
#summary of the full factorial design (especially no defining relation)                           
summary(vp.full)                                           

#returns a 2^4-1 fractional factorial design. Factor D will be aliased with
vp.frac = fracDesign(k = 4, gen = "D=ABC") 
#the three-way-interaction ABC (i.e. I = ABCD)                 
response(vp.frac) = rnorm(2^(4-1))    
#summary of the fractional factorial design                      
summary(vp.frac)                                            

#returns a full factorial design with 3 replications per factor combination 
#and 4 center points
vp.rep = fracDesign(k = 3, replicates = 3, centerCube = 4)  
#summary of the replicated fractional factorial Design
summary(vp.rep)                                             



