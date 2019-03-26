library(lmSupport)


### Name: varContrasts
### Title: Set Factor Contrasts
### Aliases: varContrasts
### Keywords: manip regression

### ** Examples

  d = data.frame(f=factor(c('f1', 'f2', 'f3')))
  contrasts(d$f)
  
  ##set as DUMMY with last category as reference
  contrasts(d$f) = varContrasts(d$f, Type='DUMMY', RefLevel = 3) 
  
  ##set as POC with user defined labels
  contrasts(d$f) = varContrasts(d$f, Type='POC', POCList = list(c(2,-1,-1),c(0,1,-1)), 
                   Labels = c('f1_v_f2f3', 'f2_v_f3')) 
                   
  ##set as reverse HELMERT                 
  contrasts(d$f) = varContrasts(d$f, Type='HELMERT', RefLevel = 1) 
  
  ##set as EFFECTS, excluding f3 vs. grand mean contrast
  contrasts(d$f) = varContrasts(d$f, Type='EFFECTS', RefLevel = 3) 



