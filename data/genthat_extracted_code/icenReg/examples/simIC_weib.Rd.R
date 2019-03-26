library(icenReg)


### Name: simIC_weib
### Title: Simulates interval censored data from regression model with a
###   Weibull baseline
### Aliases: simIC_weib

### ** Examples

set.seed(1)
sim_data <- simIC_weib(n = 500, b1 = .3, b2 = -.3, model = 'ph', 
                      shape = 2, scale = 2, inspections = 6, 
                      inspectLength = 1)
#simulates data from a cox-ph with beta weibull distribution.

diag_covar(Surv(l, u, type = 'interval2') ~ x1 + x2, 
           data = sim_data, model = 'po')
diag_covar(Surv(l, u, type = 'interval2') ~ x1 + x2,
           data = sim_data, model = 'ph')

#'ph' fit looks better than 'po'; the difference between the transformed survival
#function looks more constant



