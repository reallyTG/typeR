library(ClinReport)


### Name: report.doc
### Title: Export a statistical table into 'Microsoft Word'
### Aliases: report.doc report.doc.desc report.doc.anova

### ** Examples

## Don't show: 


library(officer)
library(flextable)
library(reshape2)
library(emmeans)
library(lme4)
library(nlme)

data(data)

tab=report.quanti(data=data,y="y_numeric",
	x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",subjid="SUBJID")

mod=glm(y_logistic~GROUP+TIMEPOINT+GROUP*TIMEPOINT,
family=binomial,data=data,na.action=na.omit)
test=emmeans(mod,~GROUP|TIMEPOINT)
tab.mod=report.lsmeans(lsm=test,x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",data=data)


doc=read_docx()

doc=body_add_par(doc,"A beautiful reporting using ClinReport", style = "heading 1")

doc=report.doc(tab,title="Quantitative statistics",
	colspan.value="Treatment group",doc=doc,init.numbering=TRUE)


doc=report.doc(tab.mod,title="Generalized Linear Mixed Model LS-Means results using lme",
	colspan.value="Treatment group",doc=doc)

## End(Don't show)


## No test: 

#####################
# Import libraries
#####################

library(officer)
library(flextable)
library(reshape2)
library(emmeans)
library(lme4)
library(nlme)
library(ggplot2)
library(car) 
library(xtable)

#####################
# Load data
#####################

data(data) 
head(data)

# Removing baseline data for the model

data.mod=droplevels(data[data$TIMEPOINT!="D0",])

#####################
# Create your stats tables and graphics
#####################

# Quatitative stats (2 explicative variables) ##################################
# since it's a big enough table, we don't want it to overlap 2 pasges
# so we split it in two with split.desc function

tab1=report.quanti(data=data,y="y_numeric",
	x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",subjid="SUBJID")


s=split(tab1,variable="TIMEPOINT",at=3)

tab1.1=s$x1
tab1.2=s$x2


gg=plot(tab1,title="Mean response evolution as a function of time by treatment group",
legend.label="Treatment groups",ylab="Y mean")

# Qualitative stats (2 explicative variables) ##################################

tab2=report.quali(data=data,y="y_logistic",
	x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",total=T,subjid="SUBJID")

gg2=plot(tab2,title="Response distribution (%) by day and treatment group",
legend.label="Y levels")

# Qualitative stats (no explicative variable)  ###################################

tab3=report.quali(data=data,y="VAR",y.label="Whatever")

# Qualitative stats (no explicative variables ; add number of subjects in header)#

tab4=report.quali(data=data,y="VAR",y.label="Whatever",
	subjid="SUBJID")

# Qualitative stats (1 explicative variable)#######################################

tab5=report.quali(data=data,y="VAR",y.label="Whatever",x1="GROUP",
	subjid="SUBJID")


# Quantitative stats (1 explicative variable)#######################################

tab6=report.quanti(data=data,y="y_numeric",y.label="Whatever 2",x1="GROUP",
	subjid="SUBJID")

# Quali-Quanti table

tab5.6=regroup(tab5,tab6)


# Linear model (order 2 interaction): Anova and LS-Means reporting ################

mod1=lm(y_numeric~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,data=data.mod)
test1=emmeans(mod1,~GROUP|TIMEPOINT)

anov1=Anova(mod1)

tab.mod1=report.lsmeans(lsm=test1,x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",data=data.mod)

gg.mod1=plot(tab.mod1,title="LS-Means response evolution as a function of time\n
by treatment group (95% CI)",
legend.label="Treatment groups",ylab="Y mean",add.ci=T)

# Linear model (1 group only): Anova and LS-Means and graph reporting ################

mod2=lm(y_numeric~baseline+GROUP,data=data.mod)

anov2=Anova(mod2,type=3)

test2=emmeans(mod2,~GROUP)
tab.mod2=report.lsmeans(lsm=test2,x1="GROUP",data=data.mod)


gg.mod2=plot(tab.mod2,title="LS-Means response\nby treatment group (95% CI)",
	legend.label="Treatment groups",ylab="Y mean",add.ci=T)

# Linear mixed model (order 2 interaction):
# Anova and LS-Means and graph reporting #################

mod3=lme(y_numeric~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,
random=~1|SUBJID,data=data.mod,na.action=na.omit)

anov3=Anova(mod3,3)

test3=emmeans(mod3,~GROUP|TIMEPOINT)

tab.mod3=report.lsmeans(lsm=test3,x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",data=data.mod)

gg.mod3=plot(tab.mod3,title="LS-Means response evolution as a function of time\n
by treatment group (95% CI Mixed model)",
	legend.label="Treatment groups",ylab="Y mean",add.ci=T)

# Contrast example

contr=contrast(test3, "trt.vs.ctrl", ref = "A")

tab.mod3.contr=report.lsmeans(lsm=contr,x1="TIMEPOINT",
	data=data.mod,contrast=TRUE,at.row="contrast")

gg.mod3.contr=plot(tab.mod3.contr,title="LS-Means contrast versus reference A\n
			(95% CI Mixed model)",
	legend.label="Treatment groups",ylab="Y mean",add.ci=T,add.line=F)



# Generalized Logistic Linear model (order 2 interaction):
# Anova LS-Means and graph reporting ##########

mod4=glm(y_logistic~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,
family=binomial,data=data.mod,na.action=na.omit)

anov4=Anova(mod4,3)

test4=emmeans(mod4,~GROUP|TIMEPOINT)

tab.mod4=report.lsmeans(lsm=test4,x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",data=data.mod)

gg.mod4=plot(tab.mod4,title="LS-Means response evolution as a function of time\n
by treatment group (95% CI Logistic model)",
	legend.label="Treatment groups",ylab="Y mean",add.ci=T)

# Generalized Poisson Linear model (order 2 interaction):
# Anova LS-Means and graph reporting #'


mod5=glm(y_poisson~baseline+GROUP+TIMEPOINT+GROUP*TIMEPOINT,
family=poisson,data=data.mod,na.action=na.omit)

anov5=Anova(mod5,3)


test5=emmeans(mod5,~GROUP|TIMEPOINT)

tab.mod5=report.lsmeans(lsm=test5,x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",type="response",data=data.mod)


gg.mod5=plot(tab.mod5,title="LS-Means response evolution as a function of time\n
by treatment group (95% CI Poisson model)",
	legend.label="Treatment groups",ylab="Y mean",add.ci=T)

#####################
# Create your report
#####################


doc=read_docx()
doc=body_add_toc(doc)


doc=body_add_par(doc,"A beautiful reporting using ClinReport", style = "heading 1")

doc=body_add_par(doc,"Descriptive statistics", style = "heading 2")

doc=report.doc(tab1.1,title="Quantitative statistics (2 explicative variables) (Table 1/2)",
	colspan.value="Treatment group",doc=doc,init.numbering=T,
page.break=F)

doc=report.doc(tab1.2,title="Quantitative statistics (2 explicative variables) (Table 2/2)",
	colspan.value="Treatment group",doc=doc)

doc=body_add_par(doc,"Corresponding graphic of outputs 1 & 2", style ="Normal") 

doc=body_add_gg(doc, value = gg, style = "centered" )

doc=body_add_break(doc)

doc=report.doc(tab2,title="Qualitative statistics (2 explicative variables)",
	colspan.value="Treatment group",doc=doc)


doc=report.doc(tab2,title="The same with smaller font size",
	colspan.value="Treatment group",doc=doc,font.size=8)

doc=body_add_par(doc,"Corresponding graphic of output 3", style ="Normal") 

doc=body_add_gg(doc, value = gg2, style = "centered" )

doc=body_add_break(doc)

doc=body_add_par(doc,"Example of mixing qualitative and quantitative
statistics with the function regroup", style ="Normal") 

doc=report.doc(tab5.6,title="Quali-Qanti statistics (1 variable only)",doc=doc)

doc=body_add_par(doc,"Statistical model results", style = "heading 2")

doc=body_add_par(doc,"Model 1", style = "heading 3")

doc=body_add_par(doc,"Anova table example", style = "Normal")

doc=report.doc(anov1,doc=doc)

doc=body_add_par(doc,"LS-Means example", style = "Normal")

doc=report.doc(tab.mod1,title="Linear Model LS-Means results using lm with interactions",
	colspan.value="Treatment group",doc=doc)

doc=body_add_gg(doc, value = gg.mod1, style = "centered" )

doc=body_add_break(doc)


doc=body_add_par(doc,"Model 2", style = "heading 3")


doc=report.doc(anov2,doc=doc)


doc=report.doc(tab.mod2,title="Linear Model LS-Means results using lm without interaction",
	colspan.value="Treatment group",doc=doc)

doc=body_add_gg(doc, value = gg.mod2, style = "centered" )

doc=body_add_break(doc)


doc=body_add_par(doc,"Model 3", style = "heading 3")

doc=report.doc(anov3,doc=doc)


doc=report.doc(tab.mod3,title="Linear Mixed Model LS-Means results using lme",
	colspan.value="Treatment group",doc=doc)

doc=body_add_gg(doc, value = gg.mod3, style = "centered" )

doc=body_add_break(doc)


doc=report.doc(tab.mod3.contr,title="LS-Means Contrast example",
	colspan.value="Timepoints",doc=doc)

doc=body_add_gg(doc, value = gg.mod3.contr, style = "centered" )

doc=body_add_break(doc)




doc=body_add_par(doc,"Model 4", style = "heading 3")

doc=report.doc(anov4,doc=doc)


doc=report.doc(tab.mod4,title="Generalized Linear Mixed Model LS-Means results using glm",
	colspan.value="Treatment group",doc=doc)

doc=body_add_gg(doc, value = gg.mod4, style = "centered" )

doc=body_add_break(doc)


doc=body_add_par(doc,"Model 5", style = "heading 3")

doc=report.doc(anov5,doc=doc)

doc=report.doc(tab.mod5,title="Poisson Model LS-Means results",
	colspan.value="Treatment group",doc=doc)

doc=body_add_gg(doc, value = gg.mod5, style = "centered" )



file=paste(tempfile(),".docx",sep="")
print(doc, target =file)
shell.exec(file)

## End(No test)




