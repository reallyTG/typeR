library(gamlss)


### Name: random
### Title: Specify a random intercept model in a GAMLSS formula
### Aliases: random re
### Keywords: regression

### ** Examples

#------------- Example 1 from Pinheiro and Bates (2000) page 15-----------------
# bring nlme
library(nlme)
data(ergoStool)
# lme model
l1<-lme(effort~Type, data=ergoStool, random=~1|Subject, method="ML")
# use random() 
t1<-gamlss(effort~Type+random(Subject), data=ergoStool )
# use re() with fixed effect within re()
t2<-gamlss(effort~re(fixed=~Type, random=~1|Subject), data=ergoStool )
# use re() with fixed effect in gamlss formula
t3<-gamlss(effort~Type+re(random=~1|Subject), data=ergoStool )
# compare lme fitted values with random
plot(fitted(l1), fitted(t1))
# compare lme fitted values with random
plot(fitted(l1), fitted(t2))
lines(fitted(l1), fitted(t3), col=2)
# getting the fitted coefficients 
getSmo(t2)
#-------------------------------------------------------------------------------
## Not run: 
##D #-------------Example 2 Hodges data---------------------------------------------
##D data(hodges)
##D plot(prind~state, data=hodges)
##D m1<- gamlss(prind~random(state), sigma.fo=~random(state), nu.fo=~random(state), 
##D             tau.fo=~random(state), family=BCT, data=hodges)
##D m2<- gamlss(prind~re(random=~1|state), sigma.fo=~re(random=~1|state), 
##D             nu.fo=~re(random=~1|state), tau.fo=~re(random=~1|state), family=BCT, 
##D             data=hodges)
##D # comparing the fitted effective degrees of freedom
##D m1$mu.df
##D m2$mu.df
##D m1$sigma.df
##D m2$sigma.df
##D m1$nu.df
##D m2$nu.df
##D m1$tau.df
##D m2$tau.df
##D # random effect for tau is not needed
##D m3<- gamlss(prind~random(state), sigma.fo=~random(state), nu.fo=~random(state),  
##D             family=BCT, data=hodges, start.from=m1)
##D plot(m3)
##D # term plots work for random but not at the moment for re()
##D op <- par(mfrow=c(2,2))
##D term.plot(m3, se=TRUE)
##D term.plot(m3, se=TRUE, what="sigma")
##D term.plot(m3, se=TRUE, what="nu")
##D par(op)
##D # getting information from a fitted lme object
##D coef(getSmo(m2))
##D ranef(getSmo(m2))
##D VarCorr(getSmo(m2))
##D summary(getSmo(m2))
##D intervals(getSmo(m2))
##D fitted(getSmo(m2))
##D fixef(getSmo(m2))
##D #  plotting 
##D plot(getSmo(m2))
##D qqnorm(getSmo(m2))
##D #----------------Example 3 from Pinheiro and Bates (2000) page 42---------------
##D data(Pixel)
##D l1 <- lme(pixel~ day+I(day^2), data=Pixel, random=list(Dog=~day, Side=~1),
##D           method="ML")
##D # this will fail 
##D #t1<-gamlss(pixel~re(fixed=~day+I(day^2), random=list(Dog=~day, Side=~1)), 
##D #           data=Pixel)
##D # but this  is working 
##D t1<-gamlss(pixel~re(fixed=~day+I(day^2), random=list(Dog=~day, Side=~1), 
##D                     opt="optim"), data=Pixel)
##D plot(fitted(l1)~fitted(t1))
##D #---------------Example 4 from Pinheiro and Bates (2000)page 146----------------
##D data(Orthodont)
##D l1 <- lme(distance~ I(age-11), data=Orthodont, random=~I(age-11)|Subject,
##D            method="ML")
##D 
##D t1<-gamlss(distance~I(age-11)+re(random=~I(age-11)|Subject), data=Orthodont)
##D plot(fitted(l1)~fitted(t1))
##D # checking the model
##D plot(t1)
##D wp(t1, ylim.all=2)
##D # two observation fat try LO
##D t2<-gamlss(distance~I(age-11)+re(random=~I(age-11)|Subject,  opt="optim", 
##D      numIter=100), data=Orthodont, family=LO)
##D plot(t2)
##D wp(t2,ylim.all=2)
##D # a bit better but not satisfactory Note that  3 paramters distibutions fail
##D #------------example 5 from Venable and Ripley (2002)--------------------------
##D library(MASS)
##D data(bacteria)
##D summary(glmmPQL(y ~ trt + I(week > 2), random = ~ 1 | ID,
##D                 family = binomial, data = bacteria))
##D s1 <- gamlss(y ~ trt + I(week > 2)+random(ID), family = BI, data = bacteria)
##D s2 <- gamlss(y ~ trt + I(week > 2)+re(random=~1|ID), family = BI, 
##D              data = bacteria)
##D s3 <- gamlss(y ~ trt + I(week > 2)+re(random=~1|ID, method="REML"), family = BI, 
##D              data = bacteria)
##D # the esimate of the random effect sd sigma_b 
##D sqrt(getSmo(s1)$tau2)
##D getSmo(s2)
##D getSmo(s3)
##D #-------------Example 6 from Pinheiro and Bates (2000) page 239-244-------------
##D # using corAR1()
##D data(Ovary)
##D # AR1 
##D l1 <- lme(follicles~sin(2*pi*Time)+cos(2*pi*Time), data=Ovary, 
##D           random=pdDiag(~sin(2*pi*Time)), correlation=corAR1())
##D # ARMA
##D l2 <- lme(follicles~sin(2*pi*Time)+cos(2*pi*Time), data=Ovary, 
##D           random=pdDiag(~sin(2*pi*Time)), correlation=corARMA(q=2))
##D # now gamlss
##D # AR1 
##D t1 <- gamlss(follicles~re(fixed=~sin(2*pi*Time)+cos(2*pi*Time), 
##D                          random=pdDiag(~sin(2*pi*Time)),
##D                          correlation=corAR1()), data=Ovary)
##D plot(fitted(l1)~fitted(t1))
##D # ARMA
##D t2 <- gamlss(follicles~re(fixed=~sin(2*pi*Time)+cos(2*pi*Time), 
##D                           random=pdDiag(~sin(2*pi*Time)),
##D                           correlation=corARMA(q=2)), data=Ovary)
##D plot(fitted(l2)~fitted(t2))
##D AIC(t1,t2)
##D wp(t2, ylim.all=1)
##D #-------------------------------------------------------------------------------  
## End(Not run)



