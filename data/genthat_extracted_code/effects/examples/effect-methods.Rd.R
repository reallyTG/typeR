library(effects)


### Name: EffectMethods
### Title: Functions For Constructing Effect Displays for Many Modeling
###   Paradigms
### Aliases: Effect.default Effect.merMod Effect.rlmerMod Effect.lme
###   Effect.gls Effect.poLCA Effect.clm2 Effect.clm Effect.clmm Effect.mlm
###   Effect.betareg
### Keywords: hplot models

### ** Examples

## Not run: 
##D # lme
##D require(nlme)
##D fm1 <- lme(distance ~ age + Sex, data = Orthodont, random = ~ 1)
##D plot(predictorEffects(fm1))
##D 
##D # gls
##D library(nlme)
##D g <- gls(Employed ~ GNP + Population,
##D          correlation=corAR1(form= ~ Year), data=longley)
##D print(predictorEffects(g))
##D 
##D # lmer  uses method Effect.lmerMod
##D if("package:nlme" ##D 
##D require(lme4)
##D data("Orthodont", package="nlme")
##D fm2 <- lmer(distance ~ age + Sex + (1 |Subject), data = Orthodont)
##D plot(allEffects(fm2))
##D 
##D # glmer  uses method Effect.lmerMod
##D require(lme4)
##D gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
##D               data = cbpp, family = binomial)
##D as.data.frame(predictorEffect("period", gm1))
##D 
##D # rlmer  uses method Effect.rlmerMod
##D require(lme4)
##D fm3 <- robustlmm::rlmer(distance ~ age + Sex + (1 |Subject), data = Orthodont)
##D plot(effect("age:Sex", fm3))
##D plot(predictorEffects(fm3, ~ age + Sex))
##D 
##D # betareg from the betareg package
##D library(betareg)
##D library(lme4)
##D data("GasolineYield", package = "betareg")
##D gy_logit <- betareg(yield ~ batch + temp, data = GasolineYield)
##D summary(gy_logit)
##D Effect("batch", gy_logit)
##D predictorEffects(gy_logit)
##D 
##D # clm in ordinal
##D require(ordinal)
##D require(MASS)
##D mod.wvs1 <- clm(poverty ~ gender + religion + degree + country*poly(age,3),
##D     data=WVS)
##D plot(Effect(c("country", "age"), mod.wvs1), 
##D      lines=list(multiline=TRUE), layout=c(2, 2))
##D 
##D # clm2
##D require(ordinal)
##D require(MASS)
##D v2 <- clm2(poverty ~ gender + religion + degree + country*poly(age,3),data=WVS)
##D plot(emod2 <- Effect(c("country", "age"), v2))
##D 
##D # clmm
##D require(ordinal)
##D require(MASS)
##D mm1 <- clmm(SURENESS ~ PROD + (1|RESP) + (1|RESP:PROD), 
##D         data = soup, link = "logit", threshold = "flexible")
##D plot(Effect("PROD", mm1),lines=list(multiline=TRUE))
##D 
##D # poLCA
##D library(poLCA)
##D data(election)
##D f2a <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,
##D              MORALB,CARESB,KNOWB,LEADB,DISHONB,INTELB)~PARTY
##D nes2a <- poLCA(f2a,election,nclass=3,nrep=5)    # log-likelihood: -16222.32
##D allEffects(nes2a)
##D 
##D # multivariate linear model
##D data(Baumann, package="carData")
##D b1 <- lm(cbind(post.test.1, post.test.2, post.test.3) ~ group + 
##D     pretest.1 + pretest.2, data = Baumann))
##D plot(Effect("group", b1)
##D 
## End(Not run)



