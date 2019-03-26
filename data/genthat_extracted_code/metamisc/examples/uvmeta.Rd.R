library(metamisc)


### Name: uvmeta
### Title: Univariate meta-analysis
### Aliases: uvmeta
### Keywords: fixed-effect heterogeneity meta-analysis random-effects
###   univariate

### ** Examples

data(Roberts)

# Frequentist random-effects meta-analysis
fit1 <- with(Roberts, uvmeta(r=SDM, r.se=SE, labels=rownames(Roberts)))
summary(fit1)
plot(fit1) #show a forest plot
fit1

## Not run: 
##D # Bayesian random effects meta-analysis 
##D fit2 <- with(Roberts, uvmeta(r=SDM, r.se=SE, labels=rownames(Roberts), method="BAYES"))
##D plot(fit2)
## End(Not run)




