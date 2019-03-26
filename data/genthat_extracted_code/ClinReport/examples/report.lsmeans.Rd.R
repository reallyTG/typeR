library(ClinReport)


### Name: report.lsmeans
### Title: 'LS Means' statistics reporting
### Aliases: report.lsmeans

### ** Examples


library(emmeans)
library(lme4)

data(data)

#Simple lm model

mod=lm(Petal.Width~Species,data=iris)
raw.lsm=emmeans(mod,~Species)
report.lsmeans(raw.lsm,"Species",data=iris)

# In case of just one intercept you must use a workaround...
iris$int=1
mod=glm(Species~int,data=iris,family=binomial)
raw.lsm=emmeans(mod,~int)
iris$int=as.factor(iris$int)
report.lsmeans(raw.lsm,"int",data=iris)

#Mixed model example using lme4

mod=lmer(y_numeric~GROUP+TIMEPOINT+GROUP*TIMEPOINT+(1|SUBJID),data=data) 
raw.lsm=emmeans(mod,~GROUP|TIMEPOINT)
report.lsmeans(lsm=raw.lsm,x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",data=data)


# GLM model with specific contrast

warp.lm <- lm(breaks ~ wool+tension+wool:tension, data = warpbreaks)
warp.emm <- emmeans(warp.lm, ~ tension | wool)
contr=contrast(warp.emm, "trt.vs.ctrl", ref = "M")
report.lsmeans(lsm=contr,x1="wool",data=warpbreaks,contrast=TRUE,at.row="contrast")




