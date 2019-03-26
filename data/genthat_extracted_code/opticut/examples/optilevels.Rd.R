library(opticut)


### Name: optilevels
### Title: Optimal Number of Factor Levels
### Aliases: optilevels bestmodel.optilevels
### Keywords: manip models

### ** Examples

## --- Factor levels with Gaussian distribution
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

ol <- optilevels(spp[,"Species3"], gr)
ol[c("delta", "coef", "rank", "levels")]

## get the final factor level
gr1 <- gr
levels(gr1) <- ol$level[[length(ol$level)]]
table(gr, gr1)

## compare the models
o0 <- lm(spp[,"Species3"] ~ gr - 1)
o1 <- lm(spp[,"Species3"] ~ gr1 - 1)
data.frame(AIC(o0, o1), delta=AIC(o0, o1)$AIC - AIC(o0))
ol$delta # should be identical

## --- Proportions with Poisson distribution
## simulation
set.seed(123)
n <- 500 # number of observations
k <- 5 # number of habitat types
b <- c(-1, -0.2, -0.2, 0.5, 1)
names(b) <- LETTERS[1:k]
x <- replicate(k, exp(rnorm(n)))
x <- x / rowSums(x) # proportions
X <- model.matrix(~.-1, data=data.frame(x))
lam <- exp(drop(crossprod(t(X), b)))
y <- rpois(n, lam)

z <- optilevels(y, x, dist="poisson")

## best model refit
bestmodel(z)

## estimates
plogis(z$coef)
plogis(b)
## optimal classification
z$rank

## get the final matrix
x1 <- mefa4::groupSums(x, 2, z$levels[[length(z$levels)]])
head(x)
head(x1)

## compare the models
m0 <- glm(y ~ x - 1, family="poisson")
m1 <- glm(y ~ x1 - 1, family="poisson")
data.frame(AIC(m0, m1), delta=AIC(m0, m1)$AIC - AIC(m0))
z$delta # should be identical

## Not run: 
##D ## dolina example with factor
##D data(dolina)
##D dolina$samp$stratum <- as.integer(dolina$samp$stratum)
##D y <- dolina$xtab[dolina$samp$method == "Q", "ppyg"]
##D x <- dolina$samp$mhab[dolina$samp$method == "Q"]
##D z <- scale(model.matrix(~ stratum + lmoist - 1,
##D     dolina$samp[dolina$samp$method == "Q",]))
##D 
##D ## without additional covariates
##D dol1 <- optilevels(y, x, z=NULL, dist="poisson")
##D dol1$rank
##D summary(bestmodel(dol1))
##D 
##D ## with additional covariates
##D dol2 <- optilevels(y, x, z, dist="poisson")
##D dol2$rank
##D summary(bestmodel(dol2))
##D 
##D ## compare the two models
##D AIC(bestmodel(dol1), bestmodel(dol2))
## End(Not run)



