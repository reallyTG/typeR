library(drc)


### Name: selenium
### Title: Data from toxicology experiments with selenium
### Aliases: selenium
### Keywords: datasets

### ** Examples


## Analysis similar to what is proposed in Jeske et al (2009)
##  but simply using existing functionality in "drc"

## Fitting the two-parameter log-logistic model with unequal ED50 and slope
sel.m1 <- drm(dead/total~conc, type, weights=total, data=selenium, fct=LL.2(), 
type="binomial")
#sel.m1b <- drm(dead/total~conc, type, weights=total, data=selenium, fct=LN.2(), 
# type="binomial", start=c(1,1,1,1,50,50,50,50))
plot(sel.m1, ylim = c(0, 1.3))
summary(sel.m1)

## Testing for equality of slopes
sel.m2 <- drm(dead/total~conc, type, weights=total, data=selenium, fct=LL.2(), 
type="binomial", pmodels=list(~1, ~factor(type)-1))
sel.m2b <- drm(dead/total~conc, type, weights=total, data=selenium, fct=LN.2(), 
type="binomial", pmodels=list(~1, ~factor(type)-1))
plot(sel.m2, ylim = c(0, 1.3))
summary(sel.m2)
anova(sel.m2, sel.m1)  # 48.654
#anova(sel.m2b, sel.m1b)
# close to the value 48.46 reported in the paper

## Testing for equality of ED50
sel.m3<-drm(dead/total~conc, type, weights=total, data=selenium, fct=LL.2(), 
type="binomial", pmodels=list(~factor(type)-1, ~1))
#sel.m3b<-drm(dead/total~conc, type, weights=total, data=selenium, fct=LN.2(), 
# type="binomial", pmodels=list(~factor(type)-1, ~1), start=c(1,1,1,1,50))
plot(sel.m3, ylim = c(0, 1.3))
summary(sel.m3)

anova(sel.m3, sel.m1)  # 123.56
#anova(sel.m3b, sel.m1b) 
# not too far from the value 138.45 reported in the paper
# (note that the estimation procedure is not exactly the same)
# (and we use the log-logistic model instead of the log-normal model)




