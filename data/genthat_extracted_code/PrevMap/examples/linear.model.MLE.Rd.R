library(PrevMap)


### Name: linear.model.MLE
### Title: Maximum Likelihood estimation for the geostatistical linear
###   Gaussian model
### Aliases: linear.model.MLE

### ** Examples

data(loaloa)
# Empirical logit transformation
loaloa$logit <- log((loaloa$NO_INF+0.5)/(loaloa$NO_EXAM-loaloa$NO_INF+0.5))
fit.MLE <- linear.model.MLE(logit ~ 1,coords=~LONGITUDE+LATITUDE,
                data=loaloa, start.cov.pars=c(0.2,0.15),
                 kappa=0.5)
summary(fit.MLE)

# Low-rank approximation
data(data_sim)
n.subset <- 200
data_subset <- data_sim[sample(1:nrow(data_sim),n.subset),]

# Logit transformation
data_subset$logit <- log(data_subset$y+0.5)/
                     (data_subset$units.m-
                      data_subset$y+0.5)
knots <- as.matrix(expand.grid(seq(-0.2,1.2,length=8),seq(-0.2,1.2,length=8)))

fit <- linear.model.MLE(formula=logit~1,coords=~x1+x2,data=data_subset,
                             kappa=2,start.cov.pars=c(0.15,0.1),low.rank=TRUE,
                             knots=knots)
summary(fit,log.cov.pars=FALSE)




