library(ClinReport)


### Name: add.stat
### Title: Add a new statistic to an existing table
### Aliases: add.stat add.stat.desc

### ** Examples


# Load the data

data(data)

# The default statistics are given here:

tab1=report.quanti(data=data,y="y_numeric",x1="GROUP",total=TRUE,subjid="SUBJID")

# Define the function corresponding to the coefficient of variation for example

cv=function(y) sd(y,na.rm=TRUE)/mean(y,na.rm=TRUE)

# We use the add.stat function to add CV at the second row:

tab1.cv=add.stat(tab1,data,func.stat=cv,func.stat.name="Coef. Var",
pos=2)

tab1.cv

# Same with 2 explicative variables

tab=report.quanti(data=data,y="y_numeric",x1="GROUP",
x2="TIMEPOINT",total=TRUE,subjid="SUBJID",
	at.row="TIMEPOINT")

tab=add.stat(tab,data,func.stat=cv,func.stat.name="Coef. Var",
pos=2)
tab

# And on position 5, we can add for example the mode

mode=function(x)
{
  x=na.omit(x)
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}


tab=add.stat(tab,data,func.stat=mode,func.stat.name="Mode",
pos=5)
tab






