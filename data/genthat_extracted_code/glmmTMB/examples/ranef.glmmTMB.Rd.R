library(glmmTMB)


### Name: ranef.glmmTMB
### Title: Extract Random Effects
### Aliases: ranef.glmmTMB ranef as.data.frame.ranef.glmmTMB coef.glmmTMB

### ** Examples

if (requireNamespace("lme4")) {
   data(sleepstudy, package="lme4")
   model <- glmmTMB(Reaction ~ Days + (1|Subject), sleepstudy)
   rr <- ranef(model)
   print(rr, simplify=FALSE)
   ## extract Subject conditional modes for conditional model
   rr$cond$Subject
   as.data.frame(rr)
}



