library(effects)


### Name: effect
### Title: Functions For Constructing Effect Displays
### Aliases: effect effect.default Effect Effect.lm Effect.multinom
###   Effect.polr Effect.svyglm allEffects allEffects.default
###   as.data.frame.eff as.data.frame.effpoly as.data.frame.efflatent
###   vcov.eff
### Keywords: hplot models

### ** Examples

mod.cowles <- glm(volunteer ~ sex + neuroticism*extraversion,
                  data=Cowles, family=binomial)
eff.cowles <- allEffects(mod.cowles, xlevels=list(extraversion=seq(0, 24, 6)),
                   fixed.predictors=list(given.values=c(sexmale=0.5)))
eff.cowles
as.data.frame(eff.cowles[[2]])

## No test: 
# the following are equivalent:
eff.ne <- effect("neuroticism*extraversion", mod.cowles)
Eff.ne <- Effect(c("neuroticism", "extraversion"), mod.cowles)
all.equal(eff.ne$fit, Eff.ne$fit)

plot(eff.cowles, 'sex', axes=list(y=list(lab="Prob(Volunteer)")))

plot(eff.cowles, 'neuroticism:extraversion',
     axes=list(y=list(lab="Prob(Volunteer)",
        ticks=list(at=c(.1,.25,.5,.75,.9)))))

plot(Effect(c("neuroticism", "extraversion"), mod.cowles,
            se=list(type="Scheffe"),
            xlevels=list(extraversion=seq(0, 24, 6)),
            fixed.predictors=list(given.values=c(sexmale=0.5))),
     axes=list(y=list(lab="Prob(Volunteer)",
        ticks=list(at=c(.1,.25,.5,.75,.9)))))

plot(eff.cowles, 'neuroticism:extraversion', lines=list(multiline=TRUE),
     axes=list(y=list(lab="Prob(Volunteer)")))

plot(effect('sex:neuroticism:extraversion', mod.cowles,
            xlevels=list(extraversion=seq(0, 24, 6))),
     lines=list(multiline=TRUE))
## End(No test)

# a nested model:

mod <- lm(log(prestige) ~ income:type + education, data=Prestige)

plot(Effect(c("income", "type"), mod, transformation=list(link=log, inverse=exp)),
     axes=list(y=list(lab="prestige")))


if (require(nnet)){
    mod.beps <- multinom(vote ~ age + gender + economic.cond.national +
                             economic.cond.household + Blair + Hague + Kennedy +
                             Europe*political.knowledge, data=BEPS)
    ## No test: 
    plot(effect("Europe*political.knowledge", mod.beps,
                xlevels=list(political.knowledge=0:3)))
    
## End(No test)

    plot(Effect(c("Europe", "political.knowledge"), mod.beps,
                xlevels=list(Europe=1:11, political.knowledge=0:3),
                fixed.predictors=list(given.values=c(gendermale=0.5))),
         lines=list(col=c("blue", "red", "orange")),
         axes=list(x=list(rug=FALSE), y=list(style="stacked")))

    ## No test: 
    plot(effect("Europe*political.knowledge", mod.beps, # equivalent
                xlevels=list(Europe=1:11, political.knowledge=0:3),
                fixed.predictors=list(given.values=c(gendermale=0.5))),
         lines=list(col=c("blue", "red", "orange")),
         axes=list(x=list(rug=FALSE), y=list(style="stacked")))
    
## End(No test)
}

if (require(MASS)){
    mod.wvs <- polr(poverty ~ gender + religion + degree + country*poly(age,3),
                    data=WVS)
    ## No test: 
    plot(effect("country*poly(age, 3)", mod.wvs))
    
## End(No test)

    plot(Effect(c("country", "age"), mod.wvs),
         axes=list(y=list(style="stacked")))

    ## No test: 
    plot(effect("country*poly(age, 3)", mod.wvs),
         axes=list(y=list(style="stacked"))) # equivalent

    plot(effect("country*poly(age, 3)", latent=TRUE, mod.wvs))
    plot(effect("country*poly(age, 3)", latent=TRUE, mod.wvs,
         se=list(type="scheffe"))) # Scheffe-type confidence envelopes
    
## End(No test)
}


mod.pres <- lm(prestige ~ log(income, 10) + poly(education, 3) + poly(women, 2),
               data=Prestige)
eff.pres <- allEffects(mod.pres, xlevels=50)
plot(eff.pres)
plot(eff.pres[1],
     axes=list(x=list(income=list(
             transform=list(trans=log10, inverse=function(x) 10^x),
             ticks=list(at=c(1000, 2000, 5000, 10000, 20000))
    ))))
## No test: 
# linear model with log-response and log-predictor
# to illustrate transforming axes and setting tick labels
mod.pres1 <- lm(log(prestige) ~ log(income) + poly(education, 3) + poly(women, 2),
                data=Prestige)
# effect of the log-predictor
eff.log <- Effect("income", mod.pres1)
# effect of the log-predictor transformed to the arithmetic scale
eff.trans <- Effect("income", mod.pres1, transformation=list(link=log, inverse=exp))
#variations:
# y-axis:  scale is log, tick labels are log
# x-axis:  scale is arithmetic, tick labels are arithmetic
plot(eff.log)

# y-axis:  scale is log, tick labels are log
# x-axis:  scale is log, tick labels are arithmetic
plot(eff.log, axes=list(x=list(income=list(
    transform=list(trans=log, inverse=exp),
    ticks=list(at=c(5000, 10000, 20000)),
    lab="income, log-scale"))))

# y-axis:  scale is log, tick labels are arithmetic
# x-axis:  scale is arithmetic, tick labels are arithmetic
plot(eff.trans, axes=list(y=list(lab="prestige")))

# y-axis:  scale is arithmetic, tick labels are arithmetic
# x-axis:  scale is arithmetic, tick labels are arithmetic
plot(eff.trans, axes=list(y=list(type="response", lab="prestige")))

# y-axis:  scale is log, tick labels are arithmetic
# x-axis:  scale is log, tick labels are arithmetic
plot(eff.trans, axes=list(
       x=list(income=list(
            transform=list(trans=log, inverse=exp),
            ticks=list(at=c(1000, 2000, 5000, 10000, 20000)),
            lab="income, log-scale")),
        y=list(lab="prestige, log-scale")),
     main="Both response and X in log-scale")

# y-axis:  scale is arithmetic, tick labels are arithmetic
# x-axis:  scale is log, tick labels are arithmetic
plot(eff.trans, axes=list(
        x=list(
            income=list(transform=list(trans=log, inverse=exp),
                        ticks=list(at=c(1000, 2000, 5000, 10000, 20000)),
                        lab="income, log-scale")),
        y=list(type="response", lab="prestige")))
## End(No test)

if (require(nlme)){ # for gls()
    mod.hart <- gls(fconvict ~ mconvict + tfr + partic + degrees, data=Hartnagel,
                    correlation=corARMA(p=2, q=0), method="ML")
    plot(allEffects(mod.hart))
    detach(package:nlme)
}

if (require(lme4)){
    data(cake, package="lme4")
    fm1 <- lmer(angle ~ recipe * temperature + (1|recipe:replicate), cake,
                REML = FALSE)
    plot(Effect(c("recipe", "temperature"), fm1))
    ## No test: 
    plot(effect("recipe:temperature", fm1),
         axes=list(grid=TRUE)) # equivalent (plus grid)
    
## End(No test)
    if (any(grepl("pbkrtest", search()))) detach(package:pbkrtest)
    detach(package:lme4)
}

## No test: 
if (require(nlme) && length(find.package("lme4", quiet=TRUE)) > 0){
    data(cake, package="lme4")
    cake$rep <- with(cake, paste( as.character(recipe), as.character(replicate), sep=""))
    fm2 <- lme(angle ~ recipe * temperature, data=cake,
               random = ~ 1 | rep, method="ML")
    plot(Effect(c("recipe", "temperature"), fm2))
    plot(effect("recipe:temperature", fm2),
         axes=list(grid=TRUE))  # equivalent (plus grid)
    }
    detach(package:nlme)
## End(No test)

## No test: 
if (require(poLCA)){
    data(election)
    f2a <- cbind(MORALG,CARESG,KNOWG,LEADG,DISHONG,INTELG,
                 MORALB,CARESB,KNOWB,LEADB,DISHONB,INTELB)~PARTY*AGE
    nes2a <- poLCA(f2a,election,nclass=3,nrep=5)
    plot(Effect(c("PARTY", "AGE"), nes2a),
         axes=list(y=list(style="stacked")))
}
## End(No test)

# mlm example
if (require(heplots)) {
    data(NLSY, package="heplots")
    mod <- lm(cbind(read,math) ~ income+educ, data=NLSY)
    eff.inc <- Effect("income", mod)
    plot(eff.inc)
    eff.edu <- Effect("educ", mod)
    plot(eff.edu, axes=list(x=list(rug=FALSE), grid=TRUE))
    ## No test: 
    plot(Effect("educ", mod, response="read"))
    
## End(No test)
    detach(package:heplots)
}

# svyglm() example (adapting an example from the survey package)

## No test: 
if (require(survey)){
  data(api)
  dstrat<-svydesign(id=~1, strata=~stype, weights=~pw,
    data=apistrat, fpc=~fpc)
  mod <- svyglm(sch.wide ~ ell + meals + mobility, design=dstrat,
    family=quasibinomial())
  plot(allEffects(mod),
    axes=list(y=list(lim=log(c(0.4, 0.99)/c(0.6, 0.01)),
      ticks=list(at=c(0.4, 0.75, 0.9, 0.95, 0.99)))))
}
## End(No test)

# component + residual plot examples

## No test: 
Prestige$type <- factor(Prestige$type, levels=c("bc", "wc", "prof"))

mod.prestige.1 <- lm(prestige ~ income + education, data=Prestige)
plot(allEffects(mod.prestige.1, residuals=TRUE)) # standard C+R plots
plot(allEffects(mod.prestige.1, residuals=TRUE,
    se=list(type="scheffe"))) # with Scheffe-type confidence bands

mod.prestige.2 <- lm(prestige ~ type*(income + education), data=Prestige)
plot(allEffects(mod.prestige.2, residuals=TRUE))

mod.prestige.3 <- lm(prestige ~ type + income*education, data=Prestige)
plot(Effect(c("income", "education"), mod.prestige.3, residuals=TRUE),
     partial.residuals=list(span=1))
## End(No test)

#  artificial data

set.seed(12345)
x1 <- runif(500, -75, 100)
x2 <- runif(500, -75, 100)
y <- 10 + 5*x1 + 5*x2 + x1^2 + x2^2 + x1*x2 + rnorm(500, 0, 1e3)
Data <- data.frame(y, x1, x2)
mod.1 <- lm(y ~ poly(x1, x2, degree=2, raw=TRUE), data=Data)
# raw=TRUE necessary for safe prediction
mod.2 <- lm(y ~ x1*x2, data=Data)
mod.3 <- lm(y ~ x1 + x2, data=Data)

plot(Effect(c("x1", "x2"), mod.1, residuals=TRUE)) # correct model
plot(Effect(c("x1", "x2"), mod.2, residuals=TRUE)) # wrong model
plot(Effect(c("x1", "x2"), mod.3, residuals=TRUE)) # wrong model



