library(SubgrpID)


### Name: SubgrpID-package
### Title: Patient subgroup identification for clinical drug development
### Aliases: SubgrpID-package
### Keywords: AIM

### ** Examples

  ## Not run: 
##D     data(Sepsis.train)
##D     data(Sepsis.test)
##D     
##D     yvar="survival"
##D     xvars=names(Sepsis.train)[2:12]
##D     trtvar="THERAPY"
##D     
##D     set.seed(123)
##D     subgrp <- SubgrpID(data.train=Sepsis.train,
##D                       yvar=yvar,
##D                       trtvar=trtvar,
##D                       trtref="active",
##D                       xvars=xvars,
##D                       type="b",
##D                       des.res = "smaller",
##D                       method="AIM.Rule")
##D     subgrp$res
##D     subgrp$train.stat
##D     subgrp$train.plot
##D   
## End(Not run)



