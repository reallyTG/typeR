library(PopED)


### Name: LinMatrixL_occ
### Title: Model linearization with respect to occasion variability
###   parameters.
### Aliases: LinMatrixL_occ
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


#for the FO approximation
ind=1

# no occasion defined in this example, so result is zero
LinMatrixL_occ(model_switch=t(poped.db$design$model_switch[ind,,drop=FALSE]),
          xt_ind=t(poped.db$design$xt[ind,,drop=FALSE]),
          x=zeros(0,1),
          a=t(poped.db$design$a[ind,,drop=FALSE]),
          bpop=poped.db$parameters$bpop[,2,drop=FALSE],
          b_ind=zeros(poped.db$parameters$NumRanEff,1),
          bocc_ind=zeros(poped.db$parameters$NumDocc,1),
          iCurrentOcc=1,
          poped.db)["y"]




