library(penalized)


### Name: Penalized generalized linear models
### Title: Penalized regression
### Aliases: penalized
### Keywords: multivariate regression

### ** Examples

# More examples in the package vignette:
#  type vignette("penalized")

data(nki70)

# A single lasso fit predicting survival
pen <- penalized(Surv(time, event), penalized = nki70[,8:77],
    unpenalized = ~ER+Age+Diam+N+Grade, data = nki70, lambda1 = 10)
show(pen)
coefficients(pen)
coefficients(pen, "penalized")
basehaz(pen)

# A single lasso fit using the clinical risk factors
pen <- penalized(Surv(time, event), penalized = ~ER+Age+Diam+N+Grade,
    data = nki70, lambda1=10, standardize=TRUE)

# using steps
pen <- penalized(Surv(time, event), penalized = nki70[,8:77],
    data = nki70, lambda1 = 1,steps = 20)
plotpath(pen)


# A fused lasso fit predicting survival
pen <- penalized(Surv(time, event), penalized = nki70[,8:77], data = nki70, 
     lambda1 = 1, lambda2 = 2, fusedl = TRUE)
plot(coefficients(pen, "all"),type="l",xlab = "probes",ylab = "coefficient value")
plot(predict(pen,penalized=nki70[,8:77]))
 


