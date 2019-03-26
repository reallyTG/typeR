library(MixedPsy)


### Name: MixPlot
### Title: Plotting univariable GLMM
### Aliases: MixPlot
### Keywords: DeltaMethod GLMM Plotting

### ** Examples

library(lme4)
data(vibro_exp3)
formula.mod <- cbind(faster, slower) ~ speed + (1 + speed| subject)
mod <- glmer(formula = formula.mod, family = binomial(link = "probit"),
              data = vibro_exp3[vibro_exp3$vibration == 0,])
define.mod <- list(pf1 = list(intercept = 1, slope = 2))
xplode.mod <- xplode(model = mod, name.cont = "speed", define.pf = define.mod)
myplot <- MixPlot(xplode.mod, pf = 1,  p05line = FALSE, x.ref = 8.5, x.range = c(1,16),
                  col = TRUE, x.label = "Stimulus Speed", y.label = "Predicted Response")




