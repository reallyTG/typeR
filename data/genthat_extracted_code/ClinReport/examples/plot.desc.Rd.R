library(ClinReport)


### Name: plot.desc
### Title: Display the corresponding graphic of statistical table
### Aliases: plot.desc

### ** Examples

 
data(data)

desc=report.quali(data=data,y="y_logistic",x1="GROUP",
	x2="TIMEPOINT")

plot(desc,
title="Qualitative desc object with 2 explicative variables",
legend.label="Y levels")



desc2=report.quanti(data=data,y="y_numeric",x1="GROUP",
	x2="TIMEPOINT")

plot(desc2,
title="Quantitative desc object with 2 explicative variables",
legend.label="Treatment groups")


#Removing baseline data in the response, for the model

data.mod=droplevels(data[data$TIMEPOINT!="D0",]) 

library(nlme)
library(emmeans)

mod3=lme(y_numeric~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,
random=~1|SUBJID,data=data.mod,na.action=na.omit)

test3=emmeans(mod3,~GROUP|TIMEPOINT)

tab.mod3=report.lsmeans(lsm=test3,x1="GROUP",
	x2="TIMEPOINT",at.row="TIMEPOINT",data=data.mod)

gg=plot(tab.mod3,title="LS Means plot example")

#Print

gg




