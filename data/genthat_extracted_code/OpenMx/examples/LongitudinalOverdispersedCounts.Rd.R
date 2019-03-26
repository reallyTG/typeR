library(OpenMx)


### Name: LongitudinalOverdispersedCounts
### Title: Longitudinal, Overdispersed Count Data
### Aliases: LongitudinalOverdispersedCounts longData wideData
### Keywords: datasets

### ** Examples

data(LongitudinalOverdispersedCounts)
head(wideData)
str(longData)
#Let's try ordinary least-squares (OLS) regression:
olsmod <- lm(y~tiem+x1+x2+x3, data=longData)
#We will see in the diagnostic plots that the residuals are poorly approximated by normality, 
#and are heteroskedastic.  We also know that the residuals are not independent of one another, 
#because we have repeated-measures data:
plot(olsmod)
#In the summary, it looks like all of the regression coefficients are significantly different 
#from zero, but we know that because the assumptions of OLS regression are violated that 
#we should not trust its results:
summary(olsmod)

#Let's try a generalized linear model (GLM).  We'll use the quasi-Poisson quasilikelihood 
#function to see how well the y variable is approximated by a Poisson distribution 
#(conditional on time and covariates):
glm.mod <- glm(y~tiem+x1+x2+x3, data=longData, family="quasipoisson")
#The estimate of the dispersion parameter should be about 1.0 if the data are 
#conditionally Poisson.  We can see that it is actually greater than 2, 
#indicating overdispersion:
summary(glm.mod)



