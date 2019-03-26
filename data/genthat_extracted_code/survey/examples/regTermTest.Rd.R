library(survey)


### Name: regTermTest
### Title: Wald test for a term in a regression model
### Aliases: regTermTest print.regTermTest
### Keywords: regression

### ** Examples

 data(esoph)
 model1 <- glm(cbind(ncases, ncontrols) ~ agegp + tobgp * 
     alcgp, data = esoph, family = binomial())
 anova(model1)

 regTermTest(model1,"tobgp")
 regTermTest(model1,"tobgp:alcgp")
 regTermTest(model1, ~alcgp+tobgp:alcgp)


 data(api)
 dclus2<-svydesign(id=~dnum+snum, weights=~pw, data=apiclus2)
 model2<-svyglm(I(sch.wide=="Yes")~ell+meals+mobility, design=dclus2, family=quasibinomial())
 regTermTest(model2, ~ell)
 regTermTest(model2, ~ell,df=NULL)
 regTermTest(model2, ~ell, method="LRT", df=Inf)
 regTermTest(model2, ~ell+meals, method="LRT", df=NULL)

 regTermTest(model2, ~ell+meals, method="WorkingWald", df=NULL)






