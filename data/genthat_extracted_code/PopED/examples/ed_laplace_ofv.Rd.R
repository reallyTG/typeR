library(PopED)


### Name: ed_laplace_ofv
### Title: Evaluate the expectation of determinant the Fisher Information
###   Matrix (FIM) using the Laplace approximation.
### Aliases: ed_laplace_ofv
### Keywords: internal

### ** Examples

## Warfarin example from software comparison in:
## Nyberg et al., "Methods and software tools for design evaluation 
##   for population pharmacokinetics-pharmacodynamics studies", 
##   Br. J. Clin. Pharm., 2014. 

## Optimization using an additive + proportional reidual error to 
##   avoid sample times at very low concentrations (time 0 or very late samoples).
library(PopED)

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

######################
# Normal distribution
######################
bpop_vals <- c(CL=0.15, V=8, KA=1.0, Favail=1)
bpop_vals_ed_n <- cbind(ones(length(bpop_vals),1)*1, # normal distribution
                        bpop_vals,
                        ones(length(bpop_vals),1)*(bpop_vals*0.1)^2) # 10% of bpop value
bpop_vals_ed_n["Favail",]  <- c(0,1,0)
bpop_vals_ed_n

## -- Define initial design  and design space
poped.db.n <- create.poped.database(ff_file="ff.PK.1.comp.oral.sd.CL",
                                    fg_file="sfg",
                                    fError_file="feps.add.prop",
                                    bpop=bpop_vals_ed_n, 
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


## ED evaluate using LaPlace approximation 
tic()
output <- evaluate.e.ofv.fim(poped.db.n,use_laplace=TRUE)
toc()
output$E_ofv

## Not run: 
##D   
##D   
##D   ## ED value using MC integration (roughly)
##D   tic()
##D   e_ofv_mc_n <- evaluate.e.ofv.fim(poped.db.n,ED_samp_size=500,ofv_calc_type = 1)
##D   toc()
##D   e_ofv_mc_n$E_ofv
##D   
##D   
##D   ## Using ed_laplce_ofv directly
##D   ed_laplace_ofv(model_switch=poped.db.n$design$model_switch,
##D                  groupsize=poped.db.n$design$groupsize,
##D                  ni=poped.db.n$design$ni,
##D                  xtopto=poped.db.n$design$xt,
##D                  xopto=poped.db.n$design$x,
##D                  aopto=poped.db.n$design$a,
##D                  bpopdescr=poped.db.n$parameters$bpop,
##D                  ddescr=poped.db.n$parameters$d,
##D                  covd=poped.db.n$parameters$covd,
##D                  sigma=poped.db.n$parameters$sigma,
##D                  docc=poped.db.n$parameters$docc, 
##D                  poped.db.n)
##D   
##D   
##D   ######################
##D   # Log-normal distribution
##D   ######################
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
##D   poped.db.ln <- create.poped.database(ff_file="ff.PK.1.comp.oral.sd.CL",
##D                                        fg_file="sfg",
##D                                        fError_file="feps.add.prop",
##D                                        bpop=bpop_vals_ed_ln, 
##D                                        notfixed_bpop=c(1,1,1,0),
##D                                        d=c(CL=0.07, V=0.02, KA=0.6), 
##D                                        sigma=c(0.01,0.25),
##D                                        groupsize=32,
##D                                        xt=c( 0.5,1,2,6,24,36,72,120),
##D                                        minxt=0,
##D                                        maxxt=120,
##D                                        a=70,
##D                                        mina=0,
##D                                        maxa=100)
##D   
##D   
##D   
##D   ## ED evaluate using LaPlace approximation 
##D   tic()
##D   output <- evaluate.e.ofv.fim(poped.db.ln,use_laplace=TRUE)
##D   toc()
##D   output$E_ofv
##D   
##D   ## expected value (roughly)
##D   tic()
##D   e_ofv_mc_ln <- evaluate.e.ofv.fim(poped.db.ln,ED_samp_size=500,ofv_calc_type = 1)[["E_ofv"]]
##D   toc()
##D   e_ofv_mc_ln
##D   
##D   ## Using ed_laplce_ofv directly
##D   ed_laplace_ofv(model_switch=poped.db.ln$design$model_switch,
##D                  groupsize=poped.db.ln$design$groupsize,
##D                  ni=poped.db.ln$design$ni,
##D                  xtopto=poped.db.ln$design$xt,
##D                  xopto=poped.db.ln$design$x,
##D                  aopto=poped.db.ln$design$a,
##D                  bpopdescr=poped.db.ln$parameters$bpop,
##D                  ddescr=poped.db.ln$parameters$d,
##D                  covd=poped.db.ln$parameters$covd,
##D                  sigma=poped.db.ln$parameters$sigma,
##D                  docc=poped.db.ln$parameters$docc, 
##D                  poped.db.ln)
##D   
##D   
##D   
##D   
## End(Not run)




