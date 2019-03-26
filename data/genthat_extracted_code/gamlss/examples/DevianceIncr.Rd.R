library(gamlss)


### Name: devianceIncr
### Title: The global deviance increment
### Aliases: devianceIncr
### Keywords: ~kwd1 ~kwd2

### ** Examples

#-----------------------------------------------------------------
# Count data set
# fit Poisson model
h1 <- gamlss(Claims~L_Population+L_Accidents+L_KI+L_Popdensity, 
             data=LGAclaims, family=PO)
p1<-devianceIncr(h1)
# fit negative binomial model
h2 <- gamlss(Claims~L_Population+L_Accidents+L_KI+L_Popdensity, 
             data=LGAclaims, family=NBI)
p2<-devianceIncr(h2)
# comparing using boxplots
boxplot(cbind(p1,p2))
# comparing using emphirical cdf
plot(ecdf(p1))
lines(ecdf(p2), col=2)
# comparing agaist the y-values
plot(p1~LGAclaims$Claims, pch=20, col="gray")
points(p2~LGAclaims$Claims, pch="-", col="orange")
#----------------------------------------------------------------
# Continuous data sets
## Not run: 
##D m1 <- gamlss(head~pb(age), data=db[1:6000,])
##D p1<-devianceIncr(m1)
##D m2 <- gamlss(head~pb(age), sigma.fo=~pb(age), nu.fo=~pb(age), 
##D       tau.fo=~pb(age), data=db[1:6000,], family=BCT)
##D p2<-d.evianceIncr(m2)
##D # comparing using summaries
##D summary(p1); summary(p2)
##D # comparing using boxplots
##D boxplot(cbind(p1,p2))
##D # comparing using histograms
##D hist(p1, col=rgb(1,0,0,0.5), xlim=c(0,50), breaks=seq(0,50,2))
##D hist(p2, col=rgb(0,0,1,0.5), add=T)
##D # comparing using emphirical cdf
##D plot(ecdf(p1))
##D lines(ecdf(p2), col=2)
## End(Not run)
#----------------------------------------------------------------







