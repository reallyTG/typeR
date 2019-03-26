library(lessR)


### Name: VariableLabels
### Title: Create or Display Variable Labels
### Aliases: VariableLabels vl
### Keywords: labels csv

### ** Examples


# read file and then variable labels from csv files
# mylabels <- Read("http://lessRstats.com/data/employee.csv")
# mylabels <- VariableLabels("http://lessRstats.com/data/employee_lbl.csv")

# construct and read variable labels from console
lbl <- "
Years, Years of Company Employment
Gender, Male or Female
Dept, Department Employed
Salary, Annual Salary (USD)
JobSat, JobSat with Work Environment
Plan, 1=GoodHealth 2=YellowCross 3=BestCare
"
mylabels <- VariableLabels(lbl)
mylabels

# add/modify a single variable label
mylabels <- VariableLabels(Salary, "Annual Salaries in USD")
mylabels

# list the contents of a single variable label
VariableLabels(Salary)

# display all variable labels
VariableLabels()




