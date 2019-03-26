library(DengueRT)


### Name: allmodels
### Title: Parameter estimate for each built-in model and model averaged
###   estimate for final size and turning point of outbreak.
### Aliases: allmodels

### ** Examples

## (data example 1)
data("dengueoutbreak1")
## Not run: 
##D ## Parameter estimate for Richards model (for Incidence data example 1)
##D allmodels(dengueoutbreak1$Incidence,dengueoutbreak1$Time, 
##D start=list(alpha=375,k=2.38,gamma=0.76,eta=16), model="Richards")
## End(Not run)
## or
p1<-allmodels(dengueoutbreak1$Incidence,dengueoutbreak1$Time, model="Richards")
## summary function for a allmodels object 
summary(p1)
## plot function for a allmodels object
plot(p1,which=c(1,2))

## Not run: 
##D ## Parameter estimate for each built-in model and model averaged 
##D ##estimate for final size and turning point of outbreak 
##D 
##D allmodels(dengueoutbreak1$Incidence,dengueoutbreak1$Time, 
##D start=list(list(alpha=375,k=2.38,gamma=0.76,eta=16), 
##D list(alpha=375,gamma=1,eta=16),list(alpha=380,eta=13,beta=7,n=5),
##D list(alpha=380,eta=20,beta=0,gamma=1),list(alpha=410,eta=12,beta=11,k=3),
##D list(alpha=380,beta=4,g=1,eta=13,k=15)), model="all")
##D ## or
##D allmodels(dengueoutbreak1$Incidence,dengueoutbreak1$Time,model="all")
##D 
##D ## (data example 2)
##D data("dengueoutbreak2")
##D # Parameter estimate for 3P Logistic model 
##D allmodels(dengueoutbreak2$Incidence,dengueoutbreak2$Time, 
##D start=list(alpha=375,gamma=1,eta=16), model="logistic3P")
##D ## or
##D allmodels(dengueoutbreak2$Incidence,dengueoutbreak2$Time,model="logistic3P")
##D 
##D ## Parameter estimate for each built-in model and model averaged estimate 
##D ##for final size and turning point of outbreak 
##D ##for Incidence data example 2
##D allmodels(dengueoutbreak2$Incidence,dengueoutbreak2$Time, 
##D start=list(list(alpha=355,k=1,gamma=1,eta=14),
##D list(alpha=355,gamma=1,eta=14), list(alpha=355,eta=13,beta=10,n=6),
##D list(alpha=355,eta=11,beta=20,gamma=1),list(alpha=355,eta=12,beta=22,k=3),
##D list(alpha=355,beta=15,g=1,eta=13,k=10)),model="all")
##D ## or
##D allmodels(dengueoutbreak2$Incidence,dengueoutbreak2$Time,model="all")
## End(Not run)



