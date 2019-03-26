library(ed50)


### Name: bootBC.ci
### Title: Estimate Confidence Interval of ED50 Using Isotonic Regression
### Aliases: bootBC.ci

### ** Examples

library(ed50)
library(boot)
pavaData <- preparePava(groupS)
bootResult <- boot(data = groupS,
              statistic = bootIsotonicRegression,
                      R = 10,
                    sim = 'parametric',
                ran.gen = bootIsotonicResample,
                    mle = list(baselinePava = pavaData,
                                  firstDose = 2.5,
                          PROBABILITY.GAMMA = 0.5),
           baselinePava = pavaData,
      PROBABILITY.GAMMA = 0.5)
bootBC.ci(tObserved = bootResult$t0[3],
              tBoot = bootResult$t[, 3],
               conf = 0.95)



