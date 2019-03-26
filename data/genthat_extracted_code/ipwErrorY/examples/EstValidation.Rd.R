library(ipwErrorY)


### Name: EstValidation
### Title: Estimation of ATE with Validation Data
### Aliases: EstValidation

### ** Examples

#create main data and validation data with sensitivity=0.95 and specificity=0.85
set.seed(100)
X1=rnorm(1200)   
A=rbinom(1200,1,1/(1+exp(-0.2-X1)))
Y=rbinom(1200,1,1/(1+exp(-0.2-A-X1)))
y1=which(Y==1)
y0=which(Y==0) 
Yast=Y
Yast[y1]=rbinom(length(y1),1,0.95)
Yast[y0]=rbinom(length(y0),1,0.15)
mainda=data.frame(A=A,X1=X1,Yast=Yast)
X1=rnorm(800)   
A=rbinom(800,1,1/(1+exp(-0.2-X1)))
Y=rbinom(800,1,1/(1+exp(-0.2-A-X1)))
y1=which(Y==1)
y0=which(Y==0) 
Yast=Y
Yast[y1]=rbinom(length(y1),1,0.95)
Yast[y0]=rbinom(length(y0),1,0.15)
validationda=data.frame(A=A,X1=X1,Y=Y,Yast=Yast)
head(mainda)
head(validationda)
#apply the optimal linear combination correction method
EstValidation(mainda,validationda,"A","Yast","X1","Y",0.95)




