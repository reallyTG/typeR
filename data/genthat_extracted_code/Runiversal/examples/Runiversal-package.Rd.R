library(Runiversal)


### Name: Runiversal-package
### Title: Converts R objects to Java style interpretable codes and XML
### Aliases: Runiversal-package Runiversal
### Keywords: package

### ** Examples

#Getting estimates from regression object as Java variables that be directly interpretable by Bean Shell.
x<-1:10
y<-rnorm(10)
ols<-lm(y~x)
betas<-ols$coefficients
cat(makejava(betas,"myBetas"))

#Getting summary report as Java variables
cat(makejava(summary(ols)))

#Getting regression results as xml 
cat(makexml(ols))

#Saving xml to file
cat(makexml(ols), file="somefile.xml")




