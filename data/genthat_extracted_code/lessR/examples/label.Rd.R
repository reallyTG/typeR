library(lessR)


### Name: label
### Title: Assign Variable Labels [Superseded by VariableLabels]
### Aliases: label
### Keywords: labels csv

### ** Examples

# read the data and variable labels
#d <- rd("http://lessRstats.com/data/employee.xlsx")
#mylabels <- vl("http://lessRstats.com/data/employee_lbl.xlsx")

# variable label as the title of a graph for non-lessR functions
# base R
#hist(d$Salary, xlab=label(Salary))
# ggplot2
#ggplot(d, aes(Salary)) + geom_histogram(binwidth=10000) + labs(x=label(Salary))

# assign a new label for the variable Years in d
#d <- label(Years, "Years Worked")
# verify
#label(Years)
# or view all variable labels in d
#db()

#d <- Read("Employee", in.lessR=TRUE)
# specify a label of variable in a data frame other than d
#myd <- Subset(Gender=="M")
#myd <- label(Gender, "Only is Male", data=myd)
#db(myd)



