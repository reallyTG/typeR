library(osDesign)


### Name: beta0
### Title: Calculate the intercept of a logistic regression model, given a
###   vector of log-odds ratio parameters and an overall prevalence.
### Aliases: beta0

### ** Examples

##
data(Ohio)

## 
XM   <- cbind(Int=1, Ohio[,1:3])
fitM <- glm(cbind(Death, N-Death) ~ factor(Age) + Sex + Race, data=Ohio,
            family=binomial)

## Overall prevalence in the observed data
##
sum(Ohio$Death)/sum(Ohio$N)

## Intercept corresponding to the original vector of log-odds ratios
## 
fitM$coef
beta0(betaX=fitM$coef[-1], X=XM, N=Ohio$N, rhoY=sum(Ohio$Death)/sum(Ohio$N))

## Reduction of Sex effect by 50%
##
betaXm    <- fitM$coef[-1]
betaXm[3] <- betaXm[3] * 0.5
beta0(betaX=betaXm, X=XM, N=Ohio$N, rhoY=sum(Ohio$Death)/sum(Ohio$N))

## Doubling of Race effect
##
betaXm    <- fitM$coef[-1]
betaXm[4] <- betaXm[4] * 2
beta0(betaX=betaXm, X=XM, N=Ohio$N, rhoY=sum(Ohio$Death)/sum(Ohio$N))



