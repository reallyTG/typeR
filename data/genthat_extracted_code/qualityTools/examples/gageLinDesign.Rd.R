library(qualityTools)


### Name: gageLinDesign
### Title: Function to create a object of class MSALinearity.
### Aliases: gageLinDesign
### Keywords: Measurement Systems Analysis

### ** Examples

# results of run A-E
A=c(2.7,2.5,2.4,2.5,2.7,2.3,2.5,2.5,2.4,2.4,2.6,2.4)  
B=c(5.1,3.9,4.2,5,3.8,3.9,3.9,3.9,3.9,4,4.1,3.8)
C=c(5.8,5.7,5.9,5.9,6,6.1,6,6.1,6.4,6.3,6,6.1)
D=c(7.6,7.7,7.8,7.7,7.8,7.8,7.8,7.7,7.8,7.5,7.6,7.7)
E=c(9.1,9.3,9.5,9.3,9.4,9.5,9.5,9.5,9.6,9.2,9.3,9.4)

# create Design
temp=gageLinDesign(ref=c(2,4,6,8,10),n=12) 
# create data.frame for results           
results=data.frame(rbind(A,B,C,D,E)) 
# enter results in Design                 
response(temp)=results                                
temp



