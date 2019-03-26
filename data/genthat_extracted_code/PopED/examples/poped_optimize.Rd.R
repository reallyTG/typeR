library(PopED)


### Name: poped_optimize
### Title: Optimization main module for PopED
### Aliases: poped_optimize

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


##############
# D-family Optimization
##############

# below are a number of ways to optimize the problem

# RS+SG+LS optimization of DOSE and sample times
# optimization with just a few iterations
# only to check that things are working
out_1 <- poped_optimize(poped.db,opt_a=TRUE,opt_xt=TRUE,
                         rsit=2,sgit=2,ls_step_size=2, 
                         iter_max=1)

## Not run: 
##D   
##D   # RS+SG+LS optimization of sample times 
##D   # (longer run time than above but more likely to reach a maximum)
##D   output <- poped_optimize(poped.db,opt_xt=T)
##D   get_rse(output$fmf,output$poped.db)
##D   plot_model_prediction(output$poped.db)
##D   
##D   # MFEA optimization with only integer times allowed
##D   mfea.output <- poped_optimize(poped.db,opt_xt=1,
##D                                 bUseExchangeAlgorithm=1,
##D                                 EAStepSize=1)
##D   get_rse(mfea.output$fmf,mfea.output$poped.db)
##D   plot_model_prediction(mfea.output$poped.db)
##D   
##D   # Examine efficiency of sampling windows
##D   plot_efficiency_of_windows(mfea.output$poped.db,xt_windows=0.5)
##D   plot_efficiency_of_windows(mfea.output$poped.db,xt_windows=1)
##D   
##D   # Random search (just a few samples here)
##D   rs.output <- poped_optimize(poped.db,opt_xt=1,opt_a=1,rsit=20,
##D                               bUseRandomSearch= 1,
##D                               bUseStochasticGradient = 0,
##D                               bUseBFGSMinimizer = 0,
##D                               bUseLineSearch = 0)
##D   get_rse(rs.output$fmf,rs.output$poped.db)
##D   
##D   # line search, DOSE and sample time optimization
##D   ls.output <- poped_optimize(poped.db,opt_xt=1,opt_a=1,
##D                               bUseRandomSearch= 0,
##D                               bUseStochasticGradient = 0,
##D                               bUseBFGSMinimizer = 0,
##D                               bUseLineSearch = 1,
##D                               ls_step_size=10)
##D   
##D   # Stochastic gradient search, DOSE and sample time optimization
##D   sg.output <- poped_optimize(poped.db,opt_xt=1,opt_a=1, 
##D                               bUseRandomSearch= 0,
##D                               bUseStochasticGradient = 1,
##D                               bUseBFGSMinimizer = 0,
##D                               bUseLineSearch = 0,
##D                               sgit=20)
##D   
##D   # BFGS search, DOSE and sample time optimization
##D   bfgs.output <- poped_optimize(poped.db,opt_xt=1,opt_a=1,
##D                                 bUseRandomSearch= 0,
##D                                 bUseStochasticGradient = 0,
##D                                 bUseBFGSMinimizer = 1,
##D                                 bUseLineSearch = 0)
##D   
##D   ##############
##D   # E-family Optimization
##D   ##############
##D   
##D   # Adding 10% log-normal Uncertainty to fixed effects (not Favail)
##D   bpop_vals <- c(CL=0.15, V=8, KA=1.0, Favail=1)
##D   bpop_vals_ed_ln <- cbind(ones(length(bpop_vals),1)*4, # log-normal distribution
##D                            bpop_vals,
##D                            ones(length(bpop_vals),1)*(bpop_vals*0.1)^2) # 10% of bpop value
##D   bpop_vals_ed_ln["Favail",]  <- c(0,1,0)
##D   bpop_vals_ed_ln
##D   
##D   ## -- Define initial design  and design space
##D   poped.db <- create.poped.database(ff_file="ff.PK.1.comp.oral.sd.CL",
##D                                     fg_file="sfg",
##D                                     fError_file="feps.add.prop",
##D                                     bpop=bpop_vals_ed_ln, 
##D                                     notfixed_bpop=c(1,1,1,0),
##D                                     d=c(CL=0.07, V=0.02, KA=0.6), 
##D                                     sigma=c(0.01,0.25),
##D                                     groupsize=32,
##D                                     xt=c( 0.5,1,2,6,24,36,72,120),
##D                                     minxt=0,
##D                                     maxxt=120,
##D                                     a=70,
##D                                     mina=0,
##D                                     maxa=100)
##D   
##D   # ED optimization using Random search (just a few samples here)
##D   output <- poped_optimize(poped.db,opt_xt=1,opt_a=1,rsit=10,d_switch=0)
##D   get_rse(output$fmf,output$poped.db)
##D   
##D   # ED with laplace approximation, 
##D   # optimization using Random search (just a few samples here)
##D   output <- poped_optimize(poped.db,opt_xt=1,opt_a=1,rsit=10,
##D                            d_switch=0,use_laplace=TRUE,laplace.fim=TRUE)
##D   get_rse(output$fmf,output$poped.db)
##D   
##D   
## End(Not run)



