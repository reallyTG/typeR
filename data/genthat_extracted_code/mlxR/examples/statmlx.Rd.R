library(mlxR)


### Name: statmlx
### Title: Summary of data
### Aliases: statmlx

### ** Examples

## Not run: 
##D modelPK <- inlineModel("
##D [LONGITUDINAL] 
##D input={V,Cl,alpha, beta,b}
##D 
##D EQUATION:
##D C = pkmodel(V, Cl)
##D h = alpha*exp(beta*C)
##D g = b*C
##D 
##D DEFINITION:
##D y = {distribution=normal, prediction=C, sd=g}
##D e = {type=event, maxEventNumber=1, rightCensoringTime=30, hazard=h}
##D 
##D [INDIVIDUAL]
##D input={V_pop,Cl_pop,omega_V,omega_Cl}
##D 
##D DEFINITION:
##D V     = {distribution=lognormal,   prediction=V_pop,    sd=omega_V}
##D Cl    = {distribution=lognormal,   prediction=Cl_pop,   sd=omega_Cl}
##D ")
##D 
##D adm  <- list(amount=100, time=0)
##D p <- c(V_pop=10, Cl_pop=1, omega_V=0.2, omega_Cl=0.2, alpha=0.02, beta=0.1, b=0.1)
##D out.y <- list(name=c('y'), time=seq(0,to=25,by=5))
##D out.e <- list(name=c('e'), time=0)
##D out.p <- c("V", "Cl")
##D out   <- list(out.y, out.e, out.p)
##D g <- list(size=100, level='individual')
##D res1 <- simulx(model=modelPK, treatment=adm, parameter=p, output=out, group=g)
##D 
##D statmlx(res1$parameter, FUN = "mean", probs = c(0.05, 0.5, 0.95))
##D statmlx(res1$parameter, FUN = "quantile", probs = c(0.05, 0.5, 0.95))
##D statmlx(res1$parameter, FUN = c("sd", "quantile"), probs = c(0.05, 0.95))
##D statmlx(res1$y, FUN = c("mean", "sd", "quantile"), probs = c(0.05, 0.95))
##D statmlx(res1$e, surv.time=c(10,20))
##D 
##D res2 <- simulx(model=modelPK, treatment=adm, parameter=p, output=out, group=g, nrep=3)
##D statmlx(res2$parameter, FUN = c("sd", "quantile"), probs = c(0.05, 0.95))
##D statmlx(res2$y, FUN = c("mean", "sd", "quantile"), probs = c(0.05, 0.95))
##D statmlx(res2$e, surv.time=c(10,20,30))
## End(Not run)



