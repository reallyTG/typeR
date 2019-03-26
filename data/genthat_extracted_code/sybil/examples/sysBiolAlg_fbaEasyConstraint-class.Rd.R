library(sybil)


### Name: sysBiolAlg_fbaEasyConstraint-class
### Title: Class '"sysBiolAlg_fbaEasyConstraint"' and Class
###   '"sysBiolAlg_mtfEasyConstraint"'
### Aliases: sysBiolAlg_fbaEasyConstraint-class
###   sysBiolAlg_fbaEasyConstraint sysBiolAlg_mtfEasyConstraint-class
###   sysBiolAlg_mtfEasyConstraint mtfEasyConstraint fbaEasyConstraint
###   EasyConstraint
### Keywords: classes

### ** Examples

  showClass("sysBiolAlg_fbaEasyConstraint")
  
  # see package vignette for second example with more comments:
  #vignette("sybil")
  
  #load model
  data(Ec_core)
  
  # allow influx of Fumarate and restrict outflux of Fumarate and Glucose
  lowbnd(Ec_core)[react_id(Ec_core) %in% c("EX_fum(e)")] <- -1000
  uppbnd(Ec_core)[react_id(Ec_core) %in% c("EX_glc(e)", "EX_fum(e)")] <- 0
  
  # see result
  findExchReact(Ec_core)
  optimizeProb(Ec_core)
  
  # define easyConstraint to have the same influx for Glucose and Fumarate:
  # EX_glc(e) = EX_fum(e)
  # here we omit the upper and lower bound, hence they are set to zero.
  ec <- list(
  	react=list(which(react_id(Ec_core) %in% c("EX_glc(e)", "EX_fum(e)"))),
  	x=list(c(1, -1)),
  	rtype="E")
  
  # optimize
  opt <- optimizeProb(Ec_core, algorithm=("fbaEasyConstraint"), easyConstraint=ec)
  
  # check if fluxes are really the same:
  fluxes(opt)[react_id(Ec_core) %in% c("EX_glc(e)", "EX_fum(e)")]
  
  
  
  
  
  
  



