library(skpr)


### Name: eval_design_survival_mc
### Title: Evaluate Power for Survival Design
### Aliases: eval_design_survival_mc

### ** Examples

#These examples focus on the survival analysis case and assume familiarity
#with the basic functionality of eval_design_mc.

#We first generate a simple 2-level design using expand.grid:
basicdesign = expand.grid(a = c(-1, 1))
design = gen_design(candidateset = basicdesign, model = ~a, trials = 15)

#We can then evaluate the power of the design in the same way as eval_design_mc,
#now including the type of censoring (either right or left) and the point at which
#the data should be censored:

eval_design_survival_mc(design = design, model = ~a, alpha = 0.05,
                        nsim = 100, distribution = "exponential",
                        censorpoint = 5, censortype = "right")

#Built-in Monte Carlo random generating functions are included for the gaussian, exponential,
#and lognormal distributions.

#We can also evaluate different censored distributions by specifying a custom
#random generating function and changing the distribution argument.

rlognorm = function(X, b) {
  Y = rlnorm(n = nrow(X), meanlog = X %*% b, sdlog = 0.4)
  censored = Y > 1.2
  Y[censored] = 1.2
  return(survival::Surv(time = Y, event = !censored, type = "right"))
}

#Any additional arguments are passed into the survreg function call.  As an example, you
#might want to fix the "scale" argument to survreg, when fitting a lognormal:

eval_design_survival_mc(design = design, model = ~a, alpha = 0.2, nsim = 100,
                        distribution = "lognormal", rfunctionsurv = rlognorm,
                        anticoef = c(0.184, 0.101), scale = 0.4)



