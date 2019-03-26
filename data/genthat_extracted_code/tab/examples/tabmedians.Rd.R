library(tab)


### Name: tabmedians
### Title: Generate Summary Tables of Median Comparisons for Statistical
###   Reports
### Aliases: tabmedians
### Keywords: table median

### ** Examples

# Load in sample dataset d and drop rows with missing values
data(d)
d <- d[complete.cases(d), ]

# Create labels for group and race
groups <- c("Control", "Treatment")
races <- c("White", "Black", "Mexican American", "Other")

# Compare median BMI in control group vs. treatment group
medtable1 <- tabmedians(x = d$Group, y = d$BMI)

# Repeat, but show first and third quartile rather than IQR in parentheses
medtable2 <- tabmedians(x = d$Group, y = d$BMI, parenth = "q1q3")

# Compare median BMI by race, suppressing overall column and (n = ) part of headings
medtable3 <- tabmedians(x = d$Race, y = d$BMI, overall.column = FALSE, n.headings = FALSE)

# Compare median BMI by quartile of age
medtable4 <- tabmedians(x = d$Age, y = d$BMI, quantiles = 4)

# Create single table comparing median BMI and median age in control vs. treatment group
medtable5 <- rbind(tabmedians(x = d$Group, y = d$BMI), tabmedians(x = d$Group, y = d$Age))
                   
# A (usually) faster way to make the above table is to call the tabmulti function
medtable6 <- tabmulti(dataset = d, xvarname = "Group", yvarnames = c("BMI", "Age"),
                      ymeasures = "median")
                        
# medtable5 and medtable6 are equivalent
all(medtable5 == medtable6)

# Click on medtable1, ... , medtable6 in the Workspace tab of RStudio to see the tables 
# that could be copied and pasted into a report or manuscript. Alternatively, setting the 
# latex input to TRUE produces tables that can be inserted into LaTeX using the xtable 
# package.



