library(PopED)


### Name: bfgsb_min
### Title: Nonlinear minimization using BFGS with box constraints
### Aliases: bfgsb_min
### Keywords: internal

### ** Examples

library(PopED)

############# START #################
## Create PopED database
## (warfarin model for optimization)
#####################################

## Warfarin example from software comparison in:
## Nyberg et al., "Methods and software tools for design evaluation 
##   for population pharmacokinetics-pharmacodynamics studies", 
##   Br. J. Clin. Pharm., 2014. 

## Optimization using an additive + proportional reidual error  
## to avoid sample times at very low concentrations (time 0 or very late samples).

## find the parameters that are needed to define from the structural model
ff.PK.1.comp.oral.sd.CL

## -- parameter definition function 
## -- names match parameters in function ff
sfg <- function(x,a,bpop,b,bocc){
  parameters=c(CL=bpop[1]*exp(b[1]),
               V=bpop[2]*exp(b[2]),
               KA=bpop[3]*exp(b[3]),
               Favail=bpop[4],
               DOSE=a[1])
  return(parameters) 
}

## -- Define initial design  and design space
poped.db <- create.poped.database(ff_fun=ff.PK.1.comp.oral.sd.CL,
                                  fg_fun=sfg,
                                  fError_fun=feps.add.prop,
                                  bpop=c(CL=0.15, V=8, KA=1.0, Favail=1), 
                                  notfixed_bpop=c(1,1,1,0),
                                  d=c(CL=0.07, V=0.02, KA=0.6), 
                                  sigma=c(0.01,0.25),
                                  groupsize=32,
                                  xt=c( 0.5,1,2,6,24,36,72,120),
                                  minxt=0.01,
                                  maxxt=120,
                                  a=70,
                                  mina=0.01,
                                  maxa=100)

############# END ###################
## Create PopED database
## (warfarin model for optimization)
#####################################


## Not run: 
##D   
##D   
##D   # BFGS search, DOSE and sample time optimization
##D   bfgs.output <- poped_optimize(poped.db,opt_xt=1,opt_a=0,
##D                                 bUseRandomSearch= 0,
##D                                 bUseStochasticGradient = 0,
##D                                 bUseBFGSMinimizer = 1,
##D                                 bUseLineSearch = 0)
##D   
##D   f_name <- 'calc_ofv_and_grad' 
##D   gen_des <- downsizing_general_design(poped.db)
##D   
##D   aa <- 0*poped.db$settings$cfaa*matrix(1,poped.db$design$m,size(poped.db$design$a,2))
##D   axt=1*poped.db$settings$cfaxt*matrix(1,poped.db$design$m,max(poped.db$design_space$maxni))
##D   
##D   f_options_1 <- list(gen_des$x,1, 0, gen_des$model_switch,
##D                     aa=aa,axt=axt,poped.db$design$groupsize,
##D                     gen_des$ni,
##D                     gen_des$xt,gen_des$x,gen_des$a,gen_des$bpop[,2,drop=F],
##D                     getfulld(gen_des$d[,2,drop=F],poped.db$parameters$covd),
##D                     poped.db$parameters$sigma,
##D                     getfulld(poped.db$parameters$docc[,2,drop=F],
##D                              poped.db$parameters$covdocc),poped.db)
##D   
##D   options=list('factr'=poped.db$settings$BFGSConvergenceCriteriaMinStep,
##D                #'factr'=0.01,
##D                'pgtol'=poped.db$settings$BFGSProjectedGradientTol,
##D                'ftol'=poped.db$settings$BFGSTolerancef,
##D                'gtol'=poped.db$settings$BFGSToleranceg,
##D                'xtol'=poped.db$settings$BFGSTolerancex)
##D   
##D   x_k=t(gen_des$xt)
##D   lb=t(gen_des$minxt)
##D   ub=t(gen_des$maxxt)
##D   
##D   output <- bfgsb_min(f_name,f_options, x_k,lb,ub,options) 
##D   
## End(Not run)




