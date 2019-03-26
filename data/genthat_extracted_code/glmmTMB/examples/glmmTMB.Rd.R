library(glmmTMB)


### Name: glmmTMB
### Title: Fit models with TMB
### Aliases: glmmTMB

### ** Examples

(m1 <- glmmTMB(count~ mined + (1|site), 
  zi=~mined, 
  family=poisson, data=Salamanders))
summary(m1)
## No test: 
## Zero-inflated negative binomial model
(m2 <- glmmTMB(count~spp + mined + (1|site), 
  zi=~spp + mined, 
  family=nbinom2, Salamanders))

## Hurdle Poisson model
(m3 <- glmmTMB(count~spp + mined + (1|site), 
  zi=~spp + mined, 
  family=truncated_poisson, Salamanders))

## Binomial model
data(cbpp, package="lme4")
(tmbm1 <- glmmTMB(cbind(incidence, size-incidence) ~ period + (1 | herd),
               data=cbpp, family=binomial))

## Dispersion model
sim1=function(nfac=40, nt=100, facsd=.1, tsd=.15, mu=0, residsd=1)
{
  dat=expand.grid(fac=factor(letters[1:nfac]), t= 1:nt)
  n=nrow(dat)
  dat$REfac=rnorm(nfac, sd= facsd)[dat$fac]
  dat$REt=rnorm(nt, sd= tsd)[dat$t]
  dat$x=rnorm(n, mean=mu, sd=residsd) + dat$REfac + dat$REt
  return(dat)
}
set.seed(101)
d1 = sim1(mu=100, residsd =10)
d2 = sim1(mu=200, residsd =5)
d1$sd="ten"
d2$sd="five"
dat = rbind(d1, d2)
m0 = glmmTMB(x~sd+(1|t), dispformula=~sd, dat)
fixef(m0)$disp
c(log(5^2), log(10^2)-log(5^2)) #expected dispersion model coefficients
## End(No test)



