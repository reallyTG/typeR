library(robustbase)


### Name: anova.lmrob
### Title: Analysis of Robust Deviances ('anova') for "lmrob" Objects
### Aliases: anova.lmrob
### Keywords: robust models regression

### ** Examples

data(salinity)
summary(m0.sali  <- lmrob(Y ~ . , data = salinity))
anova(m0.sali, Y ~ X1 + X3)
## -> X2 is not needed
(m1.sali  <- lmrob(Y ~ X1 + X3, data = salinity))
anova(m0.sali, m1.sali) # the same as before
anova(m0.sali, m1.sali, test = "Deviance")
## whereas 'X3' is highly significant:
m2 <- update(m0.sali, ~ . -X3)
anova(m0.sali, m2)
anova(m0.sali, m2,  test = "Deviance")
## Global test [often not interesting]:
anova(m0.sali, update(m0.sali, . ~ 1), test = "Wald")
anova(m0.sali, update(m0.sali, . ~ 1), test = "Deviance")

if(require("MPV")) { ## Montgomery, Peck & Vining  datasets
  Jet <- table.b13
  Jet.rflm1 <- lmrob(y ~ ., data=Jet,
                     control = lmrob.control(max.it = 500))
  summary(Jet.rflm1)

  anova(Jet.rflm1, y ~ x1 + x5 + x6, test="Wald")

  try( anova(Jet.rflm1, y ~ x1 + x5 + x6, test="Deviance") )
  ## -> Error in anovaLm....  Please fit the nested models by lmrob

  ## {{ since  all robustness weights become 0 in the nested model ! }}

  ## Ok: Do as the error message told us:
  ##    test by comparing the two *fitted* models:

  Jet.rflm2 <- lmrob(y ~ x1 + x5 + x6, data=Jet,
                     control=lmrob.control(max.it=100))
  anova(Jet.rflm1, Jet.rflm2, test="Deviance")

} # end{"MPV" data}




