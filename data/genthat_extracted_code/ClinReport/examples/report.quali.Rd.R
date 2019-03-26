library(ClinReport)


### Name: report.quali
### Title: Descriptive "qualitative" statistics (frequencies and
###   percentages) reporting
### Aliases: report.quali

### ** Examples


 
data(data)

# No explicative variable changing y labels (option y.levels.label)
report.quali(data=data,y="y_logistic",
y.label="Clinical cure",y.levels.label="Levels")

# 1 explicative variable (option x1:  levels in columns)
report.quali(data=data,y="y_logistic",x1="GROUP",y.levels.label="Clinical cure")

# 2 explicative variables (x1, levels in columns, option x2, levels in rows),
# spcacing the results (option at.row)
report.quali(data=data,y="y_logistic",x1="GROUP",
x2="TIMEPOINT",y.levels.label="Clinical cure",x2.label="Days",at.row="Days")

# 2 explicative variables with row percentages (option percent.col=F)
report.quali(data=data,y="y_logistic",x1="GROUP",
x2="TIMEPOINT",percent.col=FALSE,x2.label="Days",y.levels.label="Clinical cure")

# Add Total number of subjects in headers (option subjid="SUBJID")
report.quali(data=data,y="y_logistic",x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",subjid="SUBJID")

# Round percentages to 1 digit (option round=1)
report.quali(data=data,y="y_logistic",x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",subjid="SUBJID",round=1)


# Qualitative statistics with a response with more than one levels
tab=report.quali(data=data,y="y_poisson",x1="GROUP",
x2="TIMEPOINT",at.row="TIMEPOINT",subjid="SUBJID",round=1)

# Print formatted results
tab


#Getting raw output (unformatted) 
tab$raw.output



