library(epiR)


### Name: epi.dsl
### Title: Mixed-effects meta-analysis of binary outcomes using the
###   DerSimonian and Laird method
### Aliases: epi.dsl
### Keywords: univar univar

### ** Examples

data(epi.epidural)
epi.dsl(ev.trt = epi.epidural$ev.trt, n.trt = epi.epidural$n.trt, 
   ev.ctrl = epi.epidural$ev.ctrl, n.ctrl = epi.epidural$n.ctrl, 
   names = as.character(epi.epidural$trial), method = "odds.ratio", 
   alternative = "two.sided", conf.level = 0.95)



