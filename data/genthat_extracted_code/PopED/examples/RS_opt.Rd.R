library(PopED)


### Name: RS_opt
### Title: Optimize the objective function using an adaptive random search
###   algorithm for D-family and E-family designs.
### Aliases: RS_opt

### ** Examples

library(PopED)

############# START #################
## Create PopED database
## (warfarin model for optimization
##  with parameter uncertainty)
#####################################

## Warfarin example from software comparison in:
## Nyberg et al., "Methods and software tools for design evaluation 
##   for population pharmacokinetics-pharmacodynamics studies", 
##   Br. J. Clin. Pharm., 2014. 

## Optimization using an additive + proportional reidual error
## to avoid sample times at very low concentrations (time 0 or very late samoples).

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

# Adding 10% log-normal Uncertainty to fixed effects (not Favail)
bpop_vals <- c(CL=0.15, V=8, KA=1.0, Favail=1)
bpop_vals_ed_ln <- cbind(ones(length(bpop_vals),1)*4, # log-normal distribution
                         bpop_vals,
                         ones(length(bpop_vals),1)*(bpop_vals*0.1)^2) # 10% of bpop value
bpop_vals_ed_ln["Favail",]  <- c(0,1,0)
bpop_vals_ed_ln

## -- Define initial design  and design space
poped.db <- create.poped.database(ff_fun=ff.PK.1.comp.oral.sd.CL,
                                  fg_fun=sfg,
                                  fError_fun=feps.add.prop,
                                  bpop=bpop_vals_ed_ln, 
                                  notfixed_bpop=c(1,1,1,0),
                                  d=c(CL=0.07, V=0.02, KA=0.6), 
                                  sigma=c(0.01,0.25),
                                  groupsize=32,
                                  xt=c( 0.5,1,2,6,24,36,72,120),
                                  minxt=0,
                                  maxxt=120,
                                  a=70,
                                  mina=0,
                                  maxa=100)

############# END ###################
## Create PopED database
## (warfarin model for optimization
##  with parameter uncertainty)
#####################################


# Just a few iterations, optimize on DOSE and sample times using the full FIM
out_1 <- RS_opt(poped.db,opt_xt=1,opt_a=1,rsit=3,fim.calc.type=0)

## Not run: 
##D   
##D   RS_opt(poped.db)
##D   
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=100,compute_inv=F)
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=20,d_switch=0)
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,d_switch=0,use_laplace=T)
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,d_switch=0,use_laplace=T,laplace.fim=T)
##D   
##D   ## Different headers and footers of output
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,out_file="foo.txt")
##D   output <- RS_opt(poped.db,opt_xt=TRUE,rsit=100,trflag=FALSE)
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,out_file="")
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,header_flag=FALSE)
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,footer_flag=FALSE)
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,header_flag=FALSE,footer_flag=FALSE)
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,header_flag=FALSE,footer_flag=FALSE,out_file="foo.txt")
##D   RS_opt(poped.db,opt_xt=TRUE,rsit=10,header_flag=FALSE,footer_flag=FALSE,out_file="") 
##D 
## End(Not run)



