library(StratifiedBalancing)


### Name: stratadisc
### Title: Stratadisc()
### Aliases: stratadisc
### Keywords: ~kwd1 ~kwd2

### ** Examples

## We will first begin by simulating data in 4 covariates and a discrete outcome, with
## significant interaction terms and correlations amongst covariates (to simulate a
## non-randomized experiment with a strongly non-linear underlying model).
## First, we will create a matrix with the input variables
m=matrix(nrow=1000,ncol=5)
for ( i in 1:ncol(m)){
m[,i]=rbinom(1000,1,0.5)
}
## Next, we will create correlations amongst covariates 2,1 and 3
for( i in 1:nrow(m)){
if(m[i,3] == 1)m[i,2]=rbinom(1,1,0.8)
if(m[i,3] == 0)m[i,2]=rbinom(1,1,0.2)
if(m[i,3] == 1)m[i,1]=rbinom(1,1,0.8)
if(m[i,3] == 0)m[i,1]=rbinom(1,1,0.2)
}
## Next, we will simulate the output variable and include interaction terms
for(i in 1:nrow(m)){
a=exp(2*m[i,4] + 0.5*m[i,1] - 4*m[i,2] + 2.3*m[i,3] + 2.3*m[i,3]*m[i,2]
+ 8*m[i,1]*m[i,2] + 2.1*m[i,2]*m[i,3] + 9*m[i,3]*m[i,1])/ (1 +exp(2*m[i,4]
+ 0.5*m[i,1] - 4*m[i,2] + 2.3*m[i,3] +
2.3*m[i,3]*m[i,2] + 8*m[i,1]*m[i,2] + 2.1*m[i,2]*m[i,3] + 9*m[i,3]*m[i,1]) )
m[i,5]=rbinom(1,1,a)
}
## We are interested in determining the coefficient of covariate 4 which is 2.
##The most straightforward way of doing this
##is to use logistic regression as follows
m=as.data.frame(m)
k=glm(m[,5]~.,data=m[,(1:4)],family=binomial)
## The value of the coefficient of variable 11 found by the
##logistic regression can be retrieved using
k$coeff[5]

## We can now use the stratadisc() function to find a
##more accurate estimation of the coefficient
g=stratadisc(4,5,m)
## We need to take the log() of the first
##number returned "Odds Ratio of Impact Of Treatment On Outcome"
## and the estimated value of the parameter should be more accurate




