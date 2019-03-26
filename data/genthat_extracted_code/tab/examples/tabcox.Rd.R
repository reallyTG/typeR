library(tab)


### Name: tabcox
### Title: Generate Summary Tables of Fitted Cox Proportional Hazards
###   Regression Models for Statistical Reports
### Aliases: tabcox
### Keywords: table regression Cox proportional hazards

### ** Examples

# Load in sample dataset d and drop rows with missing values
data(d)
d <- d[complete.cases(d), ]

# Create labels for race levels
races <- c("White", "Black", "Mexican American", "Other")

# Test whether race is associated with survival
coxtable1 <- tabcox(x = d$Race, time = d$time, delta = d$delta, 
                    xlabels = c("Race", races))

# Test whether age, sex, race, and treatment group are associated with survival
coxtable2 <- tabcox(x = d[,c("Age", "Sex", "Race", "Group")], time = d$time, 
                    delta = d$delta, 
                    xlabels = c("Age", "Male", "Race", races, "Treatment"))

# Click on coxtable1 or coxtable2 in the Workspace tab of RStudio to see the tables 
# that could be copied and pasted into a report or manuscript. Alternatively, setting 
# the latex input to TRUE produces tables that can be inserted into LaTeX using the 
# xtable package.



