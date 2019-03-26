## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- echo = TRUE, message=FALSE, warning=FALSE--------------------------
library(ClinReport)
library(officer)
library(flextable)
library(dplyr)
library(reshape2)
library(nlme)
library(emmeans)
library(car)

## ---- include=TRUE-------------------------------------------------------
# We will use fake data
data(data)
print(head(data))

## ----fig.width = 8, fig.height = 6---------------------------------------
# Only one numerical response

tab1=report.quanti(data=data,y="y_numeric")
plot(tab1,title="Mean (+/-SD) of y",add.sd=T,ylab="Mean Response value",xlab="")

## ----fig.width = 8, fig.height = 6---------------------------------------
#  one numerical response ; one explicative variable

tab2=report.quanti(data=data,y="y_numeric",x1="GROUP")
plot(tab2,title="Mean (+/-SD) of y per treatment group",add.sd=T,ylab="Mean of y",xlab="",
ylim=c(-1,8))

## ----fig.width = 8, fig.height = 6---------------------------------------
#  one numerical response ; two explicative variable

tab3=report.quanti(data=data,y="y_numeric",x1="GROUP",x2="TIMEPOINT")
plot(tab3,title="Mean (+/-SD) of y per treatment group",add.sd=T,ylab="Mean of y",xlab="",
ylim=c(-1,8))

## ----fig.width = 8, fig.height = 6---------------------------------------
# Only one categorical response

tab1=report.quali(data=data,y="y_logistic")
plot(tab1,title="Distribution of y (%)",ylab="Percentages",xlab="",ylim=c(0,100))

## ----fig.width = 8, fig.height = 6---------------------------------------
# one categorical response ; one categorical explicative variable

tab1=report.quali(data=data,y="y_logistic",x1="GROUP")
plot(tab1,title="Distribution of y per treatment group (%)",
ylab="Percentages",xlab="",ylim=c(0,100),legend.label="Levels of y")

## ----fig.width = 8, fig.height = 6---------------------------------------
# one categorical response ; two categorical explicative variables

tab1=report.quali(data=data,y="y_logistic",x1="GROUP",x2="VAR")
plot(tab1,title="Distribution of y per treatment group\nand by level of VAR (%)",
ylab="Percentages",xlab="",ylim=c(0,100),legend.label="Levels of y")

## ----fig.width = 8, fig.height = 6---------------------------------------
# Only one categorical response


mod=lme(y_numeric~GROUP,
random=~1|SUBJID,data=data,na.action=na.omit)
 
test=emmeans(mod,~GROUP)
 
tab.mod=report.lsmeans(lsm=test,x1="GROUP",data=data)

plot(tab.mod,title="LS-means evolution of y per treatment group",
ylab="LS-Means",xlab="",add.ci=TRUE)


## ----fig.width = 8, fig.height = 6---------------------------------------
# Only one categorical response


mod=lme(y_numeric~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,
random=~1|SUBJID,data=data,na.action=na.omit)
 
test=emmeans(mod,~GROUP|TIMEPOINT)
 
tab.mod=report.lsmeans(lsm=test,x1="GROUP",
		x2="TIMEPOINT",at.row="TIMEPOINT",data=data)

plot(tab.mod,title="LS-means evolution of y per treatment group\nas a function of time",
ylab="LS-Means",xlab="",add.ci=TRUE)



