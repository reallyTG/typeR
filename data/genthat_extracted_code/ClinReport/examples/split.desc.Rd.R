library(ClinReport)


### Name: split.desc
### Title: Split a table of statistics in two.
### Aliases: split.desc

### ** Examples


data(data)

tab1=report.quanti(data=data,y="y_numeric",
	x1="GROUP",x2="TIMEPOINT",at.row="TIMEPOINT",subjid="SUBJID")


s=split(tab1,variable="TIMEPOINT",at=3)

tab1.1=s$x1
tab1.2=s$x2

tab1.1
tab1.2 




