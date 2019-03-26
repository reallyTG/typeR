library(lme4)


### Name: lmerControl
### Title: Control of Mixed Model Fitting
### Aliases: glmerControl lmerControl nlmerControl .makeCC

### ** Examples

str(lmerControl())
str(glmerControl())
## fit with default "bobyqa" algorithm ...
fm0 <- lmer(Reaction ~ Days +   ( 1 | Subject), sleepstudy)
fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
## or with "Nelder_Mead" (the previous default) ...
fm1_bobyqa <- update(fm1, control = lmerControl(optimizer="Nelder_Mead"))
## or with the nlminb function used in older (<1.0) versions of lme4;
## this will usually replicate older results
if (require(optimx)) {
    fm1_nlminb <- update(fm1,
                         control = lmerControl(optimizer= "optimx",
                                               optCtrl  = list(method="nlminb")))
    ## The other option here is method="L-BFGS-B".
}

## Or we can wrap base::optim():
optimwrap <- function(fn,par,lower,upper,control=list(),
                      ...) {
    if (is.null(control$method)) stop("must specify method in optCtrl")
    method <- control$method
    control$method <- NULL
    ## "Brent" requires finite upper values (lower bound will always
    ##  be zero in this case)
    if (method=="Brent") upper <- pmin(1e4,upper)
    res <- optim(par=par, fn=fn, lower=lower,upper=upper,
                 control=control,method=method,...)
    with(res, list(par  = par,
                   fval = value,
                   feval= counts[1],
                   conv = convergence,
                   message = message))
}
fm0_brent <- update(fm0,
                    control = lmerControl(optimizer = "optimwrap",
                                          optCtrl = list(method="Brent")))
## You can also use functions from the nloptr package.
if (require(nloptr)) {
    fm1_nloptr_NM <- update(fm1, control=lmerControl(optimizer="nloptwrap",
                                      optCtrl=list(algorithm="NLOPT_LN_NELDERMEAD")))
    fm1_nloptr_COBYLA <- update(fm1, control=lmerControl(optimizer="nloptwrap",
                                      optCtrl=list(algorithm="NLOPT_LN_COBYLA",
                                                   xtol_rel=1e-6,
                                                   xtol_abs=1e-10,
                                                   ftol_abs=1e-10)))
}
## other algorithm options include NLOPT_LN_SBPLX



