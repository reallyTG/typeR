library(osDesign)


### Name: phaseI
### Title: Expected phase I stratification
### Aliases: phaseI

### ** Examples

##
data(Ohio)

## Design matrix that forms the basis for model and phase I 
## stata specification 
##
XM <- cbind(Int=1, Ohio[,1:3])      ## main effects only
XI <- cbind(XM, SbyR=XM[,3]*XM[,4]) ## interaction between sex and race

## 'True' values for the underlying logistic model
##
fitM <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex + Race, data=Ohio,
            family=binomial)
fitI <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex * Race, data=Ohio,
            family=binomial)

## Stratified sampling by race
##
phaseI(betaTruth=fitM$coef, X=XM, N=Ohio$N, strata=4,
       nII0=c(125, 125),
       nII1=c(125, 125))

## Stratified sampling by age and sex
##
phaseI(betaTruth=fitM$coef, X=XM, N=Ohio$N, strata=c(2,3))
##
phaseI(betaTruth=fitM$coef, X=XM, N=Ohio$N, strata=c(2,3),
       nII0=(30+1:6),
       nII1=(40+1:6))



