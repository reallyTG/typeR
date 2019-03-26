library(mvabund)


### Name: manyany
### Title: Fitting Many Univariate Models to Multivariate Abundance Data
### Aliases: manyany print.manyany
### Keywords: models regression multivariate

### ** Examples

data(spider)
abund <- spider$abund
X <- as.matrix(spider$x)

## To fit a log-linear model assuming counts are negative binomial, via manyglm:
spidNB <- manyany("manyglm",abund,data=X,abund~X,family="negative.binomial")

logLik(spidNB) # a number of generic functions are applible to manyany objects

## To fit a glm with complementary log-log link to presence/absence data:
PAdat = pmin(as.matrix(abund),1) #constructing presence/absence dataset
spidPA <- manyany("glm",PAdat,data=X,PAdat~X,family=binomial("cloglog"))
plot(spidPA)
# There are some wild values in there for the Pardmont variable (residuals >5 or <-8).
#The Pardmont model didn't converge, coefficients are a bit crazy:
coef(spidPA) 

# Can try again using the glm2 package to fit the models, this fixes things up:
# library(glm2)
# spidPA2 <- manyany("glm",PAdat,data=X,PAdat~X,family=binomial("cloglog"),method="glm.fit2")
# plot(spidPA2) #looks much better.

## To simultaneously fit models to ordinal data using the ordinal package:
# library(ordinal)
## First construct an ordinal dataset:
# spidOrd = abund
# spidOrd[abund>1 & abund<=10]=2
# spidOrd[abund>10]=3
# for(iVar in 1:dim(spidOrd)[2])
#   spidOrd[,iVar]=factor(spidOrd[,iVar])
##Now fit a model using the clm function:
# manyOrd=manyany("clm",spidOrd,abund~bare.sand+fallen.leaves,data=X)
# plot(manyOrd)




