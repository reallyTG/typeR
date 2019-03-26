library(dosresmeta)


### Name: vpc
### Title: Variance Partition Components for dosresmeta Objects
### Aliases: vpc

### ** Examples


## loading data
data("sim_os")

## Quadratic (one-stage) dose-response model
quadr <- dosresmeta(logrr ~ dose + I(dose^2), id = id, se = se, type = type,
                    cases = cases, n = n, data = sim_os, proc = "1stage")
                    
## Plot of the estimated vpc
plot(sim_os$dose[sim_os$se!=0], vpc(quadr), xlab = "dose")
lines(lowess(sim_os$dose[sim_os$se!=0], vpc(quadr)))
 



