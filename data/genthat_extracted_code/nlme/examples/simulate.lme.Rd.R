library(nlme)


### Name: simulate.lme
### Title: Simulate Results from 'lme' Models
### Aliases: simulate.lme plot.simulate.lme print.simulate.lme
### Keywords: models

### ** Examples

## No test: 
orthSim <-
   simulate.lme(list(fixed = distance ~ age, data = Orthodont,
                     random = ~ 1 | Subject), nsim = 200,
                m2 = list(random = ~ age | Subject))
## End(No test)



