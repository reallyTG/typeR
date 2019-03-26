library(ClinReport)


### Name: report.quanti
### Title: Descriptive "quantitative" statistics (mean, SD, median...)
###   reporting
### Aliases: report.quanti

### ** Examples

 
data(data)

# Quantitative statistics with no factor

report.quanti(data=data,y="y_numeric",total=TRUE,y.label="Awesome results")

#' # Quantitative statistics with no factor with geometric mean (option geomean=TRUE)

report.quanti(data=data,y="y_numeric",y.label="Awesome results",geomean=TRUE)

# Quantitative statistics with one factor

report.quanti(data=data,y="y_numeric",x1="GROUP")

# One factor with total column

report.quanti(data=data,y="y_numeric",x1="GROUP",total=TRUE)

# Quantitative statistics with two factors

report.quanti(data=data,y="y_numeric",x1="GROUP",x2="TIMEPOINT")

# Quantitative statistics with two factors and a total column

report.quanti(data=data,y="y_numeric",x1="GROUP",x2="TIMEPOINT",total=TRUE)

# Add median absolute deviance to the median statistics

report.quanti(data=data,y="y_numeric",x1="GROUP",x2="TIMEPOINT",total=TRUE,add.mad=TRUE)

# Quantitative statistics with spacing rows (option at.row)

report.quanti(data=data,y="y_numeric",x1="GROUP",
x2="TIMEPOINT",total=TRUE,at.row="TIMEPOINT")

# Add number of subjects in headers (option subjid)

tab=report.quanti(data=data,y="y_numeric",x1="GROUP",
x2="TIMEPOINT",total=TRUE,at.row="TIMEPOINT",subjid="SUBJID")

# Print tab output
tab


#Getting a specific statistic and not the default ones

mystat=function(x) quantile(x,0.99,na.rm=TRUE)

tab=report.quanti(data=data,y="y_numeric",x1="GROUP",
x2="TIMEPOINT",total=TRUE,subjid="SUBJID",
func.stat=mystat,func.stat.name="99% quantile")
tab

mystat2=function(x) mean(x,na.rm=TRUE)/sd(x,na.rm=TRUE)

tab=report.quanti(data=data,y="y_numeric",x1="GROUP",
total=TRUE,subjid="SUBJID",func.stat=mystat2,
func.stat.name="Coefficient of variation")
tab

mode=function(x) {
  x=na.omit(x)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

tab=report.quanti(data=data,y="y_numeric",
func.stat=mode,func.stat.name="Mode")


#Getting raw output
tab$raw.output

#Getting a data.frame version of the output
tab$output




