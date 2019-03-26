library(survey)


### Name: svyloglin
### Title: Loglinear models
### Aliases: svyloglin anova.svyloglin update.svyloglin coef.svyloglin
###   print.anova.svyloglin
### Keywords: survey

### ** Examples

 data(api)
 dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
 a<-svyloglin(~stype+comp.imp,dclus1)
 b<-update(a,~.^2)
 an<-anova(a,b)
 an
 print(an, pval="saddlepoint")

 ## Wald test
 regTermTest(b, ~stype:comp.imp)

 ## linear-by-linear association
 d<-update(a,~.+as.numeric(stype):as.numeric(comp.imp))
 an1<-anova(a,d)
 an1





