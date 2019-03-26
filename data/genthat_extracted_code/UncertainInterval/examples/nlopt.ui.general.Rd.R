library(UncertainInterval)


### Name: nlopt.ui.general
### Title: Function for the determination of the population thresholds an
###   inconclusive interval for bi-normal distributed test scores.
### Aliases: nlopt.ui.general

### ** Examples

# A simple test model:
nlopt.ui.general(Se = .55, Sp = .55,
                 distribution = 'norm',
                 parameters.d0 = c(mean = 0, sd = 1),
                 parameters.d1 = c(mean = 1, sd = 1),
                 overlap.interval=c(-2,3))
# Standard procedure when using a continous distribution:
nlopt.ui.general(parameters.d0 = c(mean = 0, sd = 1),
                 parameters.d1 = c(mean = 1.6, sd = 2))
emp.AUC <- function(norm, abnorm) {
  o = outer(abnorm, norm, "-")
  mean((o > 0) + .5 * (o == 0))
}

library(MASS)
library(car)
# gamma distributed data
set.seed(4)
d0 = rgamma(100, shape=2, rate=.5)
d1 = rgamma(100, shape=7.5, rate=1)
# 1. obtain parameters
parameters.d0=fitdistr(d0, 'gamma')$estimate
parameters.d1=fitdistr(d1, 'gamma')$estimate
# 2. test if supposed distributions (gamma) is fitting
qqPlot(d0, distribution='gamma', shape=parameters.d0['shape'])
qqPlot(d1, distribution='gamma', shape=parameters.d1['shape'])
# 3. draw curves and determine overlap
curve(dgamma(x, shape=parameters.d0['shape'], rate=parameters.d0['rate']), from=0, to=16)
curve(dgamma(x, shape=parameters.d1['shape'], rate=parameters.d1['rate']), from=0, to=16, add=TRUE)
overlap.interval=c(1, 15) # ignore intersection at 0; observe large overlap
# 4. get empirical AUC
emp.AUC(d0, d1)
# about .65 --> Poor
# .90-1 = excellent (A)
# .80-.90 = good (B)
# .70-.80 = fair (C)
# .60-.70 = poor (D)
# .50-.60 = fail (F)
# 5. Get uncertain interval
(res=nlopt.ui.general (Se = .57,
                       Sp = .57,
                       distribution = 'gamma',
                       parameters.d0 = parameters.d0,
                       parameters.d1 = parameters.d1,
                       overlap.interval,
                       intersection = NULL,
                       start = NULL,
                       print.level = 0))
abline(v=c(res$intersection, res$solution))
# 6. Assess improvement when diagnosing outside the uncertain interval
sel.d0 = d0 < res$solution[1] |  d0 > res$solution[2]
sel.d1 = d1 < res$solution[1] |  d1 > res$solution[2]
(percentage.selected.d0 = sum(sel.d0) / length(d0))
(percentage.selected.d1 = sum(sel.d1) / length(d1))
emp.AUC(d0[sel.d0], d1[sel.d1])
# AUC for selected scores outside the uncertain interval
emp.AUC(d0[!sel.d0], d1[!sel.d1])
# AUC for deselected scores; worst are deselected
# weibull distributed data
set.seed(4)
d0 = rweibull(100, shape=3, scale=50)
d1 = rweibull(100, shape=3, scale=70)
# 1. obtain parameters
parameters.d0=fitdistr(d0, 'weibull')$estimate
parameters.d1=fitdistr(d1, 'weibull')$estimate
# 2. test if supposed distributions (gamma) is fitting
qqPlot(d0, distribution='weibull', shape=parameters.d0['shape'])
qqPlot(d1, distribution='weibull', shape=parameters.d1['shape'])
# 3. draw curves and determine overlap
curve(dweibull(x, shape=parameters.d0['shape'],
      scale=parameters.d0['scale']), from=0, to=150)
curve(dweibull(x, shape=parameters.d1['shape'],
      scale=parameters.d1['scale']), from=0, to=150, add=TRUE)
overlap.interval=c(1, 100) # ignore intersection at 0; observe overlap
# 4. get empirical AUC
emp.AUC(d0, d1)
# about .65 --> Poor
# .90-1 = excellent (A)
# .80-.90 = good (B)
# .70-.80 = fair (C)
# .60-.70 = poor (D)
# .50-.60 = fail (F)
# 5. Get uncertain interval
(res=nlopt.ui.general (Se = .55,
                       Sp = .55,
                       distribution = 'weibull',
                       parameters.d0 = parameters.d0,
                       parameters.d1 = parameters.d1,
                       overlap.interval,
                       intersection = NULL,
                       start = NULL,
                       print.level = 0))
abline(v=c(res$intersection, res$solution))
# 6. Assess improvement when diagnosing outside the uncertain interval
sel.d0 = d0 < res$solution[1] |  d0 > res$solution[2]
sel.d1 = d1 < res$solution[1] |  d1 > res$solution[2]
(percentage.selected.d0 = sum(sel.d0) / length(d0))
(percentage.selected.d1 = sum(sel.d1) / length(d1))
emp.AUC(d0[sel.d0], d1[sel.d1])
# AUC for selected scores outside the uncertain interval
emp.AUC(d0[!sel.d0], d1[!sel.d1])
# AUC for deselected scores; these scores are almost indistinguishable



