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

## ---- include=TRUE-------------------------------------------------------
tab1=report.quanti(data=data,y="y_numeric",
		x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",
		subjid="SUBJID")

tab1

## ---- include=TRUE-------------------------------------------------------
g1=plot(tab1,title="The title that you want to display")
print(g1)

## ---- include=TRUE-------------------------------------------------------
args(ClinReport:::plot.desc)

## ---- include=TRUE-------------------------------------------------------
report.doc(tab1,title="Quantitative statistics (2 explicative variables)",
		colspan.value="Treatment group", init.numbering =T )			

## ------------------------------------------------------------------------
doc=read_docx()
doc=report.doc(tab1,title="Quantitative statistics (2 explicative variables)",
		colspan.value="Treatment group",doc=doc,init.numbering=T)
doc=body_add_gg(doc, value = g1, style = "centered" )

## ----results='hide'------------------------------------------------------
file=paste(tempfile(),".docx",sep="")
print(doc, target =file)

#Open it
#shell.exec(file)

## ------------------------------------------------------------------------
tab=report.quali(data=data,y="y_logistic",
		x1="VAR",total=T,subjid="SUBJID")
		
report.doc(tab,title="Qualitative table with two variables",
colspan.value="A variable")	


## ------------------------------------------------------------------------
tab=report.quali(data=data,y="y_logistic",
		x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",
		total=T,subjid="SUBJID")
		
report.doc(tab,title="Qualitative table with two variables",
colspan.value="Treatment group")	


## ------------------------------------------------------------------------
tab=report.quanti(data=data,y="y_numeric",
		x1="VAR",total=T,subjid="SUBJID")
		
report.doc(tab,title="Quantitative table with one explicative variable",
colspan.value="A variable")	


## ------------------------------------------------------------------------
tab=report.quanti(data=data,y="y_numeric",
		x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",
		total=T,subjid="SUBJID")
		
report.doc(tab,title="Quantitative table with two explicative variables",
colspan.value="Treatment group")	

## ------------------------------------------------------------------------
tab1=report.quanti(data=data,y="y_numeric",
		x1="GROUP",subjid="SUBJID",y.label="Y numeric")

tab2=report.quali(data=data,y="y_logistic",
		x1="GROUP",subjid="SUBJID",y.label="Y logistic")

tab3=regroup(tab1,tab2,rbind.label="The label of your choice")


report.doc(tab3,title="Mixed Qualitative and Quantitative output",
colspan.value="Treatment group")

## ------------------------------------------------------------------------
# Removing baseline data for the model
data.mod=droplevels(data[data$TIMEPOINT!="D0",])

mod=lme(y_numeric~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,
random=~1|SUBJID,data=data.mod,na.action=na.omit)
 
anov3=Anova(mod,3)

report.doc(anov3,title="Mixed Qualitative and Quantitative output")

## ------------------------------------------------------------------------
lsm=emmeans(mod,~GROUP|TIMEPOINT)

tab=report.lsmeans(lsm,x1="GROUP",x2="TIMEPOINT",data=data.mod,
at.row="TIMEPOINT")

report.doc(tab,title="LS-Means example",
colspan.value="Treatment Group")

## ------------------------------------------------------------------------
contr=contrast(lsm, "trt.vs.ctrl", ref = "A")

# Now there is just only one explicative variable
# since we make comparison between treatment group
# so there is only x1="TIMEPOINT" in the call

tab.contr=report.lsmeans(lsm=contr,x1="TIMEPOINT",
		data=data.mod,contrast=TRUE,at.row="contrast")
		
		
report.doc(tab.contr,title="LS-Means contrast example",
colspan.value="Time points")		

