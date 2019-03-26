library(ClinReport)


### Name: regroup
### Title: Regroup two descriptive tables into one
### Aliases: regroup regroup.desc

### ** Examples


data(data)

# Example with a qualitative and a quantitative tables
#The argument y.label is stored in the desc object and 
# only used after by the regroup function

tab1=report.quanti(data=data,y="y_numeric",
	x1="GROUP",subjid="SUBJID",y.label="Y numeric")

tab2=report.quali(data=data,y="y_logistic",
	x1="GROUP",subjid="SUBJID",y.label="Y logistic")

regroup(tab1,tab2,rbind.label="The label of your choice")


# Example with 2 quantitative tables

tab1=report.quanti(data=data,y="y_numeric",
	x1="GROUP",subjid="SUBJID",y.label="Y numeric")

data$y_numeric2=rnorm(length(data$y_numeric))

tab2=report.quanti(data=data,y="y_numeric2",
	x1="GROUP",subjid="SUBJID",y.label="Y Numeric 2")

regroup(tab1,tab2,rbind.label="The label of your choice")




