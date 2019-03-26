library(psych)


### Name: sim.structure
### Title: Create correlation matrices or data matrices with a particular
###   measurement and structural model
### Aliases: sim.structure sim.structural sim.correlation
### Keywords: multivariate datagen

### ** Examples

fx <-matrix(c( .9,.8,.6,rep(0,4),.6,.8,-.7),ncol=2)  
fy <- matrix(c(.6,.5,.4),ncol=1)
rownames(fx) <- c("V","Q","A","nach","Anx")
rownames(fy)<- c("gpa","Pre","MA")
Phi <-matrix( c(1,0,.7,.0,1,.7,.7,.7,1),ncol=3)
gre.gpa <- sim.structural(fx,Phi,fy)
print(gre.gpa,2)  
#correct for attenuation to see structure

round(correct.cor(gre.gpa$model,gre.gpa$reliability),2)  
congeneric <- sim.structure(f=c(.9,.8,.7,.6)) # a congeneric model 
congeneric 




