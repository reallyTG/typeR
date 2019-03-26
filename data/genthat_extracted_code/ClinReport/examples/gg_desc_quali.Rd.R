library(ClinReport)


### Name: gg_desc_quali
### Title: Creates a ggplot object corresponding to a qualitative desc
###   object
### Aliases: gg_desc_quali

### ** Examples

 ## Don't show: 
data(data)

desc=report.quali(data=data,y="y_logistic",x1="GROUP",
	x2="TIMEPOINT")

gg=ClinReport:::gg_desc_quali(desc,
title="Qualitative desc object with 2 explicative variables",
legend.label="Y levels")


desc2=report.quali(data=data,y="y_logistic",x1="GROUP")
ClinReport:::gg_desc_quali(desc2,title="Qualitative desc object with 1 explicative variable")

desc3=report.quali(data=data,y="y_logistic")
ClinReport:::gg_desc_quali(desc3,title="Qualitative desc object with 1 explicative variable")






## End(Don't show)




