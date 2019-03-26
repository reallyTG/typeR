library(nlmixr)


### Name: configsaem
### Title: Configure an SAEM model
### Aliases: configsaem

### ** Examples

## Not run: 
##D library(nlmixr)
##D 
##D #ode <- "d/dt(depot) =-KA*depot;
##D #        d/dt(centr) = KA*depot - KE*centr;"
##D #m1 = RxODE(ode, modName="m1")
##D #ode <- "C2 = centr/V;
##D #      d/dt(depot) =-KA*depot;
##D #      d/dt(centr) = KA*depot - KE*centr;"
##D #m2 = RxODE(ode, modName="m2")
##D 
##D #Note: only use the '=' assignment, not the '<-' at this point
##D 
##D PKpars = function()
##D {
##D   CL = exp(lCL)
##D   V  = exp(lV)
##D   KA = exp(lKA)
##D   KE = CL / V
##D   #initCondition = c(0, KE - CL/V)
##D }
##D PRED = function() centr / V
##D PRED2 = function() C2
##D 
##D saem_fit <- gen_saem_user_fn(model=lincmt(ncmt=1, oral=T))
##D #saem_fit <- gen_saem_user_fn(model=m1, PKpars, pred=PRED)
##D #saem_fit <- gen_saem_user_fn(model=m2, PKpars, pred=PRED2)
##D 
##D 
##D #--- saem cfg
##D nmdat = theo_sd
##D model = list(saem_mod=saem_fit, covars="WT")
##D inits = list(theta=c(.05, .5, 2))
##D cfg   = configsaem(model, nmdat, inits)
##D cfg$print = 50
##D 
##D #cfg$Rfn = nlmixr:::Ruser_function_cmt
##D #dyn.load("m1.d/m1.so");cfg$Rfn = nlmixr:::Ruser_function_ode
##D fit = saem_fit(cfg)
##D df = simple.gof(fit)
##D xyplot(DV~TIME|ID, df, type=c("p","l"), lwd=c(NA,1), pch=c(1,NA), groups=grp)
##D fit
## End(Not run)



