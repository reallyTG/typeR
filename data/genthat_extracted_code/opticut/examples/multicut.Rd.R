library(opticut)


### Name: multicut
### Title: Multi-level Response Model
### Aliases: multicut multicut.default multicut.formula multicut1
###   getMLE.multicut bestpart.multicut bestmodel.multicut fitted.multicut
###   predict.multicut lcplot lcplot.multicut1 plot.multicut plot.multicut1
###   strata.multicut print.multicut print.multicut1 subset.multicut
###   summary.multicut print.summary.multicut as.data.frame.multicut
###   as.data.frame.summary.multicut getMLE.multicut
### Keywords: models utilities

### ** Examples

## --- Gaussian
## simple example from Legendre 2013
## Indicator Species: Computation, in
## Encyclopedia of Biodiversity, Volume 4
## http://dx.doi.org/10.1016/B978-0-12-384719-5.00430-5
gr <- as.factor(paste0("X", rep(1:5, each=5)))
spp <- cbind(Species1=rep(c(4,6,5,3,2), each=5),
    Species2=c(rep(c(8,4,6), each=5), 4,4,2, rep(0,7)),
    Species3=rep(c(18,2,0,0,0), each=5))
rownames(spp) <- gr
## must add some noise to avoid perfect fit
spp[6, "Species1"] <- 7
spp[1, "Species3"] <- 17
spp

## negative expected values are not good
oco <- ocoptions(fix_fitted=TRUE)
summary(ocall <- multicut(spp ~ 1, strata=gr, dist="gaussian"))
summary(multicut(spp, strata=gr, dist="gaussian")) # alternative
ocoptions(oco) # reset options

## --- Binomial
## simulated binary data
set.seed(1234)
n <- 200
x0 <- sample(1:4, n, TRUE)
x1 <- ifelse(x0 <= 2, 1, 0)
x2 <- rnorm(n, 0.5, 1)
p1 <- plogis(-0.5 + 2*x1 + -0.8*x2)
Y1 <- rbinom(n, 1, p1)
p2 <- plogis(-0.1 + 2*ifelse(x0==4,1,0) + -0.8*x2)
Y2 <- rbinom(n, 1, p2)
p3 <- plogis(-0.1 + -0.8*x2)
Y3 <- rbinom(n, 1, p3)
Y <- cbind(SPP1=Y1, SPP2=Y2, SPP3=Y3)
X <- model.matrix(~x2)

(m0 <- multicut1(Y1, X, as.factor(x0), dist="binomial"))
lcplot(m0)

summary(m1 <- multicut(Y ~ x2, strata=x0, dist="poisson"))
plot(m1)

## subset results
summary(subset(m1, 1:2))

## best partition
head(bestpart(m1))

## best model
mods <- bestmodel(m1)
mods
## explore further
confint(mods[[1]])

## MLE and variance-covariance matrix (species 1)
getMLE(m1, which = 1, vcov=TRUE)

## fitted values
head(fitted(m1))
## prediction for new data
head(predict(m1, gnew=x0, xnew=data.frame(x2=x2)))

## Not run: 
##D ## --- Zero-inflated Negative Binomial
##D ## dolina example
##D data(dolina)
##D ## stratum as ordinal
##D dolina$samp$stratum <- as.integer(dolina$samp$stratum)
##D ## filter species to speed up things a bit
##D Y <- dolina$xtab[,colSums(dolina$xtab > 0) >= 20]
##D ## opticut results, note the cloglog link function
##D dol <- multicut(Y ~ stratum + lmoist + method, data=dolina$samp,
##D     strata=dolina$samp$mhab, dist="zinb:cloglog")
##D summary(dol)
##D ## vertical plot orientation
##D plot(dol, horizontal=FALSE, pos=1, upper=0.8)
##D 
##D ## parallel
##D library(parallel)
##D cl <- makeCluster(2)
##D multicut(Y ~ stratum + lmoist + method, data=dolina$samp,
##D     strata=dolina$samp$mhab, dist="zip",cl=cl)
##D stopCluster(cl)
##D 
##D ## --- Customizing distributions
##D ## we may want to expand the Zero-inflation component in a ZIP model
##D ## see how the return value needs to be structured
##D fun <- function(Y, X, linkinv, zi_term, ...) {
##D     X <- as.matrix(X)
##D     mod <- pscl::zeroinfl(Y ~ X-1 | zi_term, dist = "poisson", ...)
##D     list(coef=coef(mod),
##D         logLik=logLik(mod),
##D         linkinv=mod$linkinv)
##D }
##D Xdol <- model.matrix(~ stratum + lmoist + method, data=dolina$samp)
##D ## this fits the null model (i.e. no partitions added)
##D fun(Y[,"amin"], Xdol, zi_term=dolina$samp$method)
##D ## now we can use dist=fun
##D multicut1(Y[,"amin"], Xdol, Z=dolina$samp$mhab,
##D     dist=fun, zi_term=dolina$samp$method)
##D dol2 <- multicut(Y ~ stratum + lmoist + method, data=dolina$samp,
##D     strata=dolina$samp$mhab, dist=fun, zi_term=dolina$samp$method)
##D summary(dol2)
## End(Not run)



