library(SubgrpID)


### Name: SubgrpID
### Title: Exploratory Subgroup Identification main function
### Aliases: SubgrpID
### Keywords: BATTing Sequential-BATTing AIM-Rule PRIM

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
##D                       data.test=Sepsis.test,
##D                       yvar=yvar,
##D                       trtvar=trtvar,
##D                       trtref="active",
##D                       xvars=xvars,
##D                       type="b",
##D                       des.res = "smaller",
##D                       method="AIM.Rule")
##D     subgrp$res
##D     subgrp$train.stat
##D     subgrp$test.stat
##D     subgrp$train.plot
##D     subgrp$test.plot
##D   
## End(Not run)



