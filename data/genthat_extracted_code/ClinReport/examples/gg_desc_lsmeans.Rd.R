library(ClinReport)


### Name: gg_desc_lsmeans
### Title: Creates a ggplot object corresponding to a LS Means desc object
### Aliases: gg_desc_lsmeans

### ** Examples

## Don't show: 

library(nlme)
library(emmeans)

data(data)
#Removing baseline data in the response, for the model

data.mod=droplevels(data[data$TIMEPOINT!="D0",]) 

mod3=lme(y_numeric~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,
random=~1|SUBJID,data=data.mod,na.action=na.omit)

test3=emmeans(mod3,~GROUP|TIMEPOINT)

tab.mod3=report.lsmeans(lsm=test3,x1="GROUP",
	x2="TIMEPOINT",at.row="TIMEPOINT",data=data.mod)

gg=ClinReport:::gg_desc_lsmeans(tab.mod3,title="LS Means plot example")


test4=emmeans(mod3,~GROUP)
tab.mod4=report.lsmeans(lsm=test4,x1="GROUP",data=data.mod)

gg=ClinReport:::gg_desc_lsmeans(tab.mod4,title="LS Means plot example")

gg2=ClinReport:::gg_desc_lsmeans(tab.mod4,title="LS Means plot example",add.ci=TRUE)

## End(Don't show)




