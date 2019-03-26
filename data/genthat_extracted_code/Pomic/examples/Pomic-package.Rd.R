library(Pomic)


### Name: Pomic-package
### Title: Pattern Oriented Modeling Information Criterion for ABM/IBM
### Aliases: Pomic-package Pomic
### Keywords: misc utilities programming

### ** Examples

#example of field pattern distribution:        
fieldpattern<-rnorm(100,10,5)
#model results:
model1runs<- rnorm(100*5,10.5,6)
model2runs<- rnorm(100*5,9.5,2)
#POMDEV measurements:
pomdev.extra(fieldpattern,model1runs,eps=10^-20,plotting=TRUE)
pomdev.extra(fieldpattern,model2runs,eps=10^-20,plotting=TRUE)
pomdev(fieldpattern,model2runs,eps=10^-20)
pomdev.corrected(fieldpattern,model1runs,eps=10^-20)
pomdev.corrected(fieldpattern,model2runs,eps=10^-20)

#other examples of POMDEV measures:
pomdev(x<-rnorm(100),y<-rnorm(100,0.1)) 
#POMDEV value for a model creating a normal distribution 
#with identical variance as the field data but a mean 0.1 
#away from the field data
par(mfrow=c(2,2))
hist(x,freq=FALSE) #plot the field data as histogram
lines(density(y))#check the simulation results distribution as line
pomdev(x<-rnorm(100),y<-rnorm(100,0.2)) #idem 0.2 away from the field data
hist(x,freq=FALSE); lines(density(y)) #plot
pomdev(x<-rnorm(100),y<-rnorm(100,1))   #idem 1 away from the field data
hist(x,freq=FALSE); lines(density(y)) #plot
pomdev(x<-rnorm(100),y<-rnorm(100,3))   #idem 3 away from the field data
hist(x,freq=FALSE); lines(density(y)) #plot

## Not run: demo(demoPomic)
## Not run: demo(verification)




