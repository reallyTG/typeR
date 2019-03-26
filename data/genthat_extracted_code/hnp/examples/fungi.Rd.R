library(hnp)


### Name: fungi
### Title: _Diaphorina citri_ mortality data
### Aliases: fungi
### Keywords: datasets

### ** Examples

data(fungi)

# Binomial fit
model1 <- glm(cbind(y, m-y) ~ lconc*species,
              family=binomial, data=fungi)
anova(model1, test="Chisq")
sum(resid(model1, ty="pearson")^2)
1 - pchisq(sum(resid(model1, ty="pearson")^2), 20)
hnp(model1)

# Quasi-binomial fit
model2 <- glm(cbind(y, m-y) ~ lconc*species,
              family=quasibinomial, data=fungi)
anova(model2, test="F")
hnp(model2)

## Not run: 
##D # Logistic-normal fit
##D require(lme4)
##D fungi$ind <- factor(1:nrow(fungi))
##D model3 <- glmer(cbind(y, m-y) ~ lconc*species + (1|ind),
##D                 family=binomial, data=fungi)
##D summary(model3)
##D hnp(model3)
## End(Not run)

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)



