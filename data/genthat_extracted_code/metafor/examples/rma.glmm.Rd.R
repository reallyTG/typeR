library(metafor)


### Name: rma.glmm
### Title: Meta-Analysis via Generalized Linear (Mixed-Effects) Models
### Aliases: rma.glmm
### Keywords: models

### ** Examples

### random-effects model using rma.uni() (standard RE model analysis)
rma(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
    data=dat.bcg, method="ML", verbose=TRUE)

### random-effects models using rma.glmm() (require 'lme4' package)

### unconditional model with fixed study effects
## Not run: 
##D rma.glmm(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
##D          data=dat.bcg, model="UM.FS", verbose=TRUE)
## End(Not run)

### unconditional model with random study effects
## Not run: 
##D rma.glmm(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
##D          data=dat.bcg, model="UM.RS", verbose=TRUE)
## End(Not run)

### conditional model with approximate likelihood
## Not run: 
##D rma.glmm(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
##D          data=dat.bcg, model="CM.AL", verbose=TRUE)
## End(Not run)

### conditional model with exact likelihood (be patient!)
### note: fitting this model is very slow, so be patient
## Not run: 
##D rma.glmm(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
##D          data=dat.bcg, model="CM.EL", verbose=TRUE)
## End(Not run)



