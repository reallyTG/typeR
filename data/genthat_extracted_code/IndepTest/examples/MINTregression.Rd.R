library(IndepTest)


### Name: MINTregression
### Title: MINTregression
### Aliases: MINTregression

### ** Examples

## No test: 
# Correctly specified linear model
x=runif(100,min=-1.5,max=1.5); y=x+rnorm(100)
plot(lm(y~x),which=1) 
MINTregression(x,y,5,10,w=FALSE,rnorm(10000))
# Misspecified mean linear model
x=runif(100,min=-1.5,max=1.5); y=x^3+rnorm(100)
plot(lm(y~x),which=1)
MINTregression(x,y,5,10,w=FALSE,rnorm(10000))
# Heteroscedastic linear model
x=runif(100,min=-1.5,max=1.5); y=x+x*rnorm(100);
plot(lm(y~x),which=1) 
MINTregression(x,y,5,10,w=FALSE,rnorm(10000))
# Multivariate misspecified mean linear model
x=matrix(runif(1500,min=-1.5,max=1.5),ncol=3)
y=x[,1]^3+0.3*x[,2]-0.3*x[,3]+rnorm(500)
plot(lm(y~x),which=1)
MINTregression(x,y,30,50,w=TRUE,rnorm(50000))  
## End(No test)




