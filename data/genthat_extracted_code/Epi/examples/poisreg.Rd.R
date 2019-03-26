library(Epi)


### Name: poisreg
### Title: Family Object for Poisson Regression
### Aliases: poisreg
### Keywords: models

### ** Examples

  ## Estimate incidence rate of diabetes in Denmark (1996-2015) by
  ## age and sex
  data(DMepi)
  DMepi$agegrp <- cut(DMepi$A, seq(from=0, to=100, by=5))
  inc.diab <- glm(cbind(X, Y.nD) ~ 0 + agegrp + sex, family=poisreg,
                  data=DMepi)
  ## The coefficients for agegrp are log incidence rates for men in each
  ## age group. The coefficient for sex is the log of the female:male
  ## incidence rate ratio.
  summary(inc.diab)

  ## Smooth function with non-constant M/F RR:
  requireNamespace("mgcv")
  library( mgcv )
  gam.diab <- gam( cbind(X, Y.nD) ~ s(A,by=sex) + sex,
                   family=poisreg,
                   data=DMepi)
  ## There is no need/use for Y.nD in prediction data frames:
  nM <- data.frame( A=20:90, sex="M" )
  nF <- data.frame( A=20:90, sex="F" )
  ## Rates are returned in units of (1 year)^-1, so we must scale the
  ## rates by hand: 
  matshade( nM$A, cbind( ci.pred(gam.diab,     nM    )*1000,
                         ci.pred(gam.diab,        nF )*1000,
                         ci.exp( gam.diab,list(nM,nF)) ),
            plot=TRUE, col=c("blue","red","black"),
            log="y", xlab="Age", ylab="DM incidence rates per 1000     /     M vs. F RR" )
  abline(h=1)



