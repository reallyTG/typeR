library(ipptoolbox)


### Name: basicfunctions
### Title: Basic functions
### Aliases: dsstruct dsnorm dsred

### ** Examples

a=dsstruct(matrix(c(2,3,0.1,1.5,5,0.9),ncol=3,byrow=TRUE))
b=dsstruct(matrix(c(2,3,0.5,10,5,0.9),ncol=3,byrow=TRUE))
c=dsodf('qexp',10000,dsstruct(c(10,20,1)));
d=dsred(c,0.02)
dscdf(d);



