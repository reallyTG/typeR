library(lessR)


### Name: ttest
### Title: Generic Method for t-test and Standardized Mean Difference with
###   Enhanced Graphics
### Aliases: ttest tt tt.brief
### Keywords: t.test smd

### ** Examples

# ----------------------------------------------------------
# tt for two groups, from a formula
# ----------------------------------------------------------

d <- Read("Employee", in.lessR=TRUE, quiet=TRUE)


# analyze data with formula version
# variable names and levels of X are automatically obtained from data
# although data frame not attached, reference variable names directly
ttest(Salary ~ Gender)

# short form
tt(Salary ~ Gender)

# brief version of results
tt.brief(Salary ~ Gender)

# return the vectors group1 and group2 into the object t.out
# separate the data values for the two groups and analyze separately
t.out <- ttest(Salary ~ Gender)
Histogram(group1, data=t.out)
Histogram(group2, data=t.out)

# compare to standard R function t.test
t.test(d$Salary ~ d$Gender, var.equal=TRUE)

# consider the practical importance of the difference
ttest(Salary ~ Gender, msmd=.5)

# obtain the line chart of the response variable for each group
ttest(Salary ~ Gender, line.chart=TRUE)

# variable of interest is in a data frame which is not the default d
# access the data frame in the lessR dat.twogroup data set
# although data not attached, access the variables directly by their name
data(dataLearn)
ttest(Score ~ StudyType, data=dataLearn)


# ----------------------------------------------------------
# tt for a single group, from data
# ----------------------------------------------------------

# confidence interval only, from data
ttest(Salary)

# confidence interval and hypothesis test, from data
ttest(Salary, mu=52000)


# -------------------------------------------------------
# tt for two groups from data stored in two vectors 
# -------------------------------------------------------

# create two separate vectors of response variable Y
# the vectors exist are not in a data frame
#   their lengths need not be equal
Y1 <- round(rnorm(n=10, mean=50, sd=10),2)
Y2 <- round(rnorm(n=10, mean=60, sd=10),2)

# analyze the two vectors directly
# usually explicitly specify variable names and levels of X
#   to enhance the readability of the output
ttest(Y1, Y2, Ynm="MyY", Xnm="MyX", X1nm="Group1", X2nm="Group2")

# dependent groups t-test from vectors in global environment
ttest(Y1, Y2, paired=TRUE)

# dependent groups t-test from variables in data frame d
d <- data.frame(Y1,Y2)
rm(Y1);  rm(Y2)
ttest(Y1, Y2, paired=TRUE)
# independent groups t-test from variables (vectors) in a data frame
ttest(Y1, Y2)


# -------------------------------------------------------
# tt from summary statistics
# -------------------------------------------------------

# one group: sample size, mean and sd
# optional variable name added
tt(n=34, m=8.92, s=1.67, Ynm="Time")

# confidence interval and hypothesis test, from descriptive stats
# get rid of the data frame, analysis should still proceed
rm(d)
tt.brief(n=34, m=8.92, s=1.67, mu=9, conf.level=0.90)

# two groups: sample size, mean and sd for each group
# specify the briefer form of the output
tt.brief(n1=19, m1=9.57, s1=1.45, n2=15, m2=8.09, s2=1.59)



