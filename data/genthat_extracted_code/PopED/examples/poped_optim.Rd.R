library(PopED)


### Name: poped_optim
### Title: Optimize a design defined in a PopED database
### Aliases: poped_optim

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


# ARS+BFGS+LS optimization of dose
# optimization with just a few iterations
# only to check that things are working
out_1 <- poped_optim(poped.db,opt_a =TRUE,
                      control = list(ARS=list(iter=2),
                                     BFGS=list(maxit=2),
                                     LS=list(line_length=2)),
                      iter_max = 1)

# cost function
# PRED at 120 hours
crit_fcn <- function(poped.db,...){
  pred_df <- model_prediction(poped.db)
  return(pred_df[pred_df$Time==120,"PRED"])
}

# maximize cost function
out_2 <- poped_optim(poped.db,opt_a =TRUE,
                     ofv_fun=crit_fcn,
                     control = list(ARS=list(iter=2),
                                    BFGS=list(maxit=2),
                                    LS=list(line_length=2)),
                     iter_max = 2)

# minimize the cost function
out_3 <- poped_optim(poped.db,opt_a =TRUE,
                     ofv_fun=crit_fcn,
                     control = list(ARS=list(iter=2),
                                    BFGS=list(maxit=2),
                                    LS=list(line_length=2)),
                     iter_max = 2,
                     maximize = FALSE,
                     evaluate_fim = FALSE)


## Not run: 
##D   
##D   # RS+BFGS+LS optimization of sample times 
##D   # (longer run time than above but more likely to reach a maximum)
##D   output <- poped_optim(poped.db,opt_xt=T,parallel = TRUE)
##D   
##D   get_rse(output$FIM,output$poped.db)
##D   plot_model_prediction(output$poped.db)
##D   
##D   # optimization with only integer times allowed
##D   poped.db.2 <- poped.db
##D   poped.db.2$design_space$xt_space <- matrix(list(seq(1,120)),1,8)
##D   output_2 <- poped_optim(poped.db.2,opt_xt=T,parallel = TRUE)
##D 
##D   get_rse(output_2$FIM,output_2$poped.db)
##D   plot_model_prediction(output_2$poped.db)
##D   
##D   # Examine efficiency of sampling windows
##D   plot_efficiency_of_windows(output_2$poped.db,xt_windows=0.5)
##D   plot_efficiency_of_windows(output_2$poped.db,xt_windows=1)
##D   
##D   # Adaptive Random Search (ARS, just a few samples here)
##D   rs.output <- poped_optim(poped.db,opt_xt=T,method = "ARS",
##D                            control = list(ARS=list(iter=5)))
##D   
##D   get_rse(rs.output$FIM,rs.output$poped.db)
##D   
##D   # line search, DOSE and sample time optimization
##D   ls.output <- poped_optim(poped.db,opt_xt=T,opt_a=T,method = "LS",
##D                            control = list(LS=list(line_length=5)))
##D   
##D   # Adaptive random search, 
##D   # DOSE and sample time optimization
##D   ars.output <- poped_optim(poped.db,opt_xt=T,opt_a=T,method = "ARS",
##D                            control = list(ARS=list(iter=5)))
##D   
##D   # BFGS gradient search from the stats::optim() function, 
##D   # DOSE and sample time optimization
##D   bfgs.output <- poped_optim(poped.db,opt_xt=T,opt_a=T,method = "BFGS",
##D                             control = list(BFGS=list(maxit=5)))
##D   
##D   
##D   # genetic algorithm from the GA::ga() function, 
##D   # DOSE and sample time optimization
##D   ga.output <- poped_optim(poped.db,opt_xt=T,opt_a=F,method = "GA",parallel=T)
##D   
##D   # cost function with GA
##D   # maximize
##D   out_2 <- poped_optim(poped.db,opt_a =TRUE,
##D                        ofv_fun=crit_fcn,
##D                        parallel = T,
##D                        method=c("GA"))
##D   
##D   # cost function with GA
##D   # minimize
##D   out_2 <- poped_optim(poped.db,opt_a =TRUE,
##D                        ofv_fun=crit_fcn,
##D                        parallel = T,
##D                        method=c("GA"),
##D                        iter_max = 1,
##D                        maximize = F,
##D                        evaluate_fim = F)
##D   
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
##D   
##D   # E_ln(D) optimization using Random search (just a few samples here)
##D   output <- poped_optim(poped.db,opt_xt=TRUE,opt_a=TRUE,d_switch=0,
##D                         method = c("ARS","LS"),
##D                         control = list(ARS=list(iter=2),
##D                                        LS=list(line_length=2)),
##D                         iter_max = 1)
##D   get_rse(output$FIM,output$poped.db)
##D   
##D   # ED with laplace approximation, 
##D   # optimization using Random search (just a few iterations here)
##D   ars.output <- poped_optim(poped.db,opt_xt=T,opt_a=T,method = "ARS",
##D                             d_switch=0,use_laplace=TRUE,#laplace.fim=TRUE,
##D                             parallel=T,
##D                             control = list(ARS=list(iter=5)))
##D   
## End(Not run)



