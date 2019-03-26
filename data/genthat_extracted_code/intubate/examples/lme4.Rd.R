library(intubate)


### Name: lme4
### Title: Interfaces for lme4 package for data science pipelines.
### Aliases: ntbt_glmer ntbt_glmer.nb ntbt_glFormula ntbt_lFormula
###   ntbt_lmer ntbt_nlmer
### Keywords: intubate magrittr lme4 glmer glmer.nb glFormula lFormula lmer
###   lmList nlmer

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(lme4)
##D 
##D ## ntbt_glmer: Fitting Generalized Linear Mixed-Effects Models
##D ## Original function to interface
##D glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
##D       data = cbpp, family = binomial)
##D 
##D ## The interface puts data as first parameter
##D ntbt_glmer(cbpp, cbind(incidence, size - incidence) ~ period + (1 | herd),
##D            family = binomial)
##D 
##D ## so it can be used easily in a pipeline.
##D cbpp %>%
##D   ntbt_glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
##D              family = binomial)
##D 
##D 
##D ## ntbt_glmer.nb: Fitting Negative Binomial GLMMs
##D set.seed(101)
##D dd <- expand.grid(f1 = factor(1:3),
##D                   f2 = LETTERS[1:2], g=1:9, rep=1:15,
##D                   KEEP.OUT.ATTRS=FALSE)
##D summary(mu <- 5*(-4 + with(dd, as.integer(f1) + 4*as.numeric(f2))))
##D dd$y <- rnbinom(nrow(dd), mu = mu, size = 0.5)
##D 
##D ## Original function to interface
##D glmer.nb(y ~ f1*f2 + (1|g), data = dd, verbose = FALSE)
##D  
##D ## The interface puts data as first parameter
##D ntbt_glmer.nb(dd, y ~ f1*f2 + (1|g), verbose = FALSE)
##D 
##D ## so it can be used easily in a pipeline.
##D dd %>%
##D   ntbt_glmer.nb(y ~ f1*f2 + (1|g), verbose = FALSE)
##D 
##D 
##D ## ntbt_lmer: Fit Linear Mixed-Effects Models
##D 
##D ## Original function to interface
##D lmer(Reaction ~ Days + (Days || Subject), sleepstudy)
##D 
##D ## The interface puts data as first parameter
##D ntbt_lmer(sleepstudy, Reaction ~ Days + (Days || Subject))
##D 
##D ## so it can be used easily in a pipeline.
##D sleepstudy %>%
##D   ntbt_lmer(Reaction ~ Days + (Days || Subject))
##D 
##D 
##D ## ntbt_lmList: Fit List of lm Objects with a Common Model
##D ## Original function to interface
##D lmList(Reaction ~ Days | Subject, sleepstudy)
##D 
##D ## The interface puts data as first parameter
##D ntbt_lmList(sleepstudy, Reaction ~ Days | Subject)
##D 
##D ## so it can be used easily in a pipeline.
##D sleepstudy %>%
##D   ntbt_lmList(Reaction ~ Days | Subject)
##D 
##D 
##D ## Original function to interface
##D lFormula(Reaction ~ Days + (Days|Subject), sleepstudy)
##D glFormula(Reaction ~ Days + (Days|Subject), sleepstudy)
##D 
##D ## The interface puts data as first parameter
##D ntbt_lFormula(sleepstudy, Reaction ~ Days + (Days|Subject))
##D ntbt_glFormula(sleepstudy, Reaction ~ Days + (Days|Subject))
##D 
##D ## so it can be used easily in a pipeline.
##D sleepstudy %>%
##D   ntbt_lFormula(Reaction ~ Days + (Days|Subject))
##D sleepstudy %>%
##D   ntbt_glFormula(Reaction ~ Days + (Days|Subject))
##D 
##D 
##D ## ntbt_nlmer: Fitting Nonlinear Mixed-Effects Models
##D ## Original function to interface
##D nlmer(circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree,
##D       Orange, start = c(Asym = 200, xmid = 725, scal = 350))
##D 
##D ## The interface puts data as first parameter
##D ntbt_nlmer(Orange, circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree,
##D            start = c(Asym = 200, xmid = 725, scal = 350))
##D 
##D ## so it can be used easily in a pipeline.
##D Orange %>%
##D   ntbt_nlmer(circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree,
##D              start = c(Asym = 200, xmid = 725, scal = 350))
## End(Not run)



