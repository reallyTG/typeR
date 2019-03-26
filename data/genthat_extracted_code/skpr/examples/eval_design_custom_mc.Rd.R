library(skpr)


### Name: eval_design_custom_mc
### Title: Monte Carlo power evaluation for experimental designs with
###   user-supplied libraries
### Aliases: eval_design_custom_mc

### ** Examples

#To demonstrate how a user can use their own libraries for Monte Carlo power generation,
#We will recreate eval_design_survival_mc using the eval_design_custom_mc framework.

#To begin, first let us generate the same design and random generation function shown in the
#eval_design_survival_mc examples:

basicdesign = expand.grid(a = c(-1, 1))
design = gen_design(candidateset = basicdesign, model = ~a, trials = 100,
                         optimality = "D", repeats = 100)

#Random number generating function

rsurvival = function(X, b) {
 Y = rexp(n = nrow(X), rate = exp(-(X %*% b)))
 censored = Y > 1
 Y[censored] = 1
 return(survival::Surv(time = Y, event = !censored, type = "right"))
}

#We now need to tell the package how we want to fit our data,
#given the formula and the model matrix X (and, if needed, the list of contrasts).
#If the contrasts aren't required, "contrastslist" should be set to NULL.
#This should return some type of fit object.

fitsurv = function(formula, X, contrastslist = NULL) {
 return(survival::survreg(formula, data = X, dist = "exponential"))
}


#We now need to tell the package how to extract the p-values from the fit object returned
#from the fit function. This is how to extract the p-values from the survreg fit object:

pvalsurv = function(fit) {
 return(summary(fit)$table[, 4])
}

#And now we evaluate the design, passing the fitting function and p-value extracting function
#in along with the standard inputs for eval_design_mc.

d = eval_design_custom_mc(design = design, model = ~a,
                         alpha = 0.05, nsim = 100,
                         fitfunction = fitsurv, pvalfunction = pvalsurv,
                         rfunction = rsurvival, effectsize = 1)

#This has the exact same behavior as eval_design_survival_mc for the exponential distribution.



