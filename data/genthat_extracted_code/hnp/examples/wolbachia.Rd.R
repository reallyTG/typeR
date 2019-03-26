library(hnp)


### Name: wolbachia
### Title: _Trichogramma galloi_ parasitism data
### Aliases: wolbachia
### Keywords: datasets

### ** Examples

data(wolbachia)

# Binomial fit
model1 <- glm(cbind(y, m-y) ~ treat, family=binomial, data=wolbachia)
anova(model1, test="Chisq")

# Quasi-binomial fit
model2 <- glm(cbind(y, m-y) ~ treat, family=quasibinomial, data=wolbachia)
summary(model2)
anova(model2,test="F")

## half normal plots
par(mfrow=c(1,2),cex=1.2, cex.main=1.1)
hnp(model1, print=TRUE, pch=4, main="(a) Binomial",
    xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2, print=TRUE, pch=4, main="(b) Quasi-binomial",
    xlab="Half-normal scores", ylab='')

## Not run: 
##D # Beta-binomial fit                                                
##D ### using package aods3
##D require(aods3)                                                     
##D                                                                    
##D model3 <- aodml(cbind(y, m-y) ~ treat, family='bb', data=wolbachia)
##D hnp(model3, print=TRUE, pch=4,                                     
##D     xlab="Half-normal scores", ylab='Deviance residuals')          
##D 
##D ### using package VGAM
##D require(VGAM)
##D 
##D model3a <- vglm(cbind(y, m-y) ~ treat, family=betabinomial,
##D                 data=wolbachia)
##D summary(model3a)
##D 1/(1+exp(-coef(model3a)[2])) # phi estimate
##D hnp(model3a, data=wolbachia)
## End(Not run)

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)



