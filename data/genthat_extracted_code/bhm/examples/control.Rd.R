library(bhm)


### Name: bhmControl
### Title: Auxiliary function for bhm fitting
### Aliases: bhmControl prolikControl
### Keywords: control

### ** Examples

## To fit a prognostic model for biomarker with two cut-points, 
## 500 burn-in samples and 10000 Gibbs samples,

ctl = bhmControl(interaction = FALSE, B = 500, R = 10000, c.n = 2)

##
## then fit the following model
##
#  fit = bhmFit(x, y, family = 'surv', control = ctl)
##



