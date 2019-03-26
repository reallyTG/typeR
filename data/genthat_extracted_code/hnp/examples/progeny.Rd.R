library(hnp)


### Name: progeny
### Title: _Sitophilus zeamais_ progeny
### Aliases: progeny
### Keywords: datasets

### ** Examples

data(progeny)

# Poisson fit
model1 <- glm(y ~ extract, family=poisson, data=progeny)
anova(model1, test="Chisq")                
                 
# Quasi-Poisson fit    
model2 <- glm(y ~ extract, family=quasipoisson, data=progeny)
summary(model2)$dispersion
anova(model2, test="F")

# half-normal plots
par(mfrow=c(1,2),cex=1.4, cex.main=0.9, pty='s')
hnp(model1, pch=4, main="(a) Poisson; log-linear",
    xlab="Half-normal scores", ylab="Deviance residuals")
hnp(model2, pch=4, main="(b) Quasi-Poisson; log-linear",
    xlab="Half-normal scores", ylab="Deviance residuals")
    
anova(model1, test="Chisq") # Poisson model
anova(model2, test="F") # quasi-Poisson model
summary(model1) # Poisson model
summary(model2) # quasi-Poisson model

# now with factor level parameterisation
summary(update(model1,.~.-1))
summary(update(model2,.~.-1))

## for discussion on the analysis of this data set,
## see Demetrio et al. (2014)



