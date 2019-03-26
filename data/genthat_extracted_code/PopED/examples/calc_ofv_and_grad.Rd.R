library(PopED)


### Name: calc_ofv_and_grad
### Title: Compute an objective function and gradient
### Aliases: calc_ofv_and_grad
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


opta=TRUE
aa=opta*poped.db$settings$cfaa*matrix(1,poped.db$design$m,size(poped.db$design$a,2))
aa

optxt=TRUE
axt=optxt*poped.db$settings$cfaxt*matrix(1,poped.db$design$m,max(poped.db$design_space$maxni))
axt

calc_ofv_and_grad(x=c(poped.db$design$xt,poped.db$design$a),
                  optxt=optxt, opta=opta, 
                  model_switch=poped.db$design$model_switch,
                  aa=aa,
                  axt=axt,
                  groupsize=poped.db$design$groupsize,
                  ni=poped.db$design$ni,
                  xtopto=poped.db$design$xt,
                  xopto=poped.db$design$x,
                  aopto=poped.db$design$a,
                  bpop=poped.db$parameters$param.pt.val$bpop,
                  d=poped.db$parameters$param.pt.val$d,
                  sigma=poped.db$parameters$param.pt.val$sigma,
                  docc_full=poped.db$parameters$param.pt.val$docc,
                  poped.db,
                  only_fim=FALSE)

## Not run: 
##D   
##D   # BFGS search, DOSE and sample time optimization
##D   bfgs.output <- poped_optimize(poped.db,opt_xt=1,opt_a=1,
##D                                 bUseRandomSearch= 0,
##D                                 bUseStochasticGradient = 0,
##D                                 bUseBFGSMinimizer = 1,
##D                                 bUseLineSearch = 0)
##D   
## End(Not run)







