library(tab)


### Name: tab-package
### Title: Functions for Creating Summary Tables for Statistical Reports
### Aliases: tab-package tab
### Keywords: package

### ** Examples

# Load in sample dataset d and drop rows with missing values
data(d)
d <- d[complete.cases(d), ]

# Compare race distribution by group, with group as column variable
freqtable <- tabfreq(x = d$Group, y = d$Race)

# Compare mean BMI in control group vs. treatment group
meanstable <- tabmeans(x = d$Group, y = d$BMI)

# Generate plot comparing mean BMI in control group vs. treatment group
meansfig <- tabmeans(x = d$Group, y = d$BMI, fig = TRUE)

# Compare median BMI in control group vs. treatment group
medianstable <- tabmedians(x = d$Group, y = d$BMI)

# Create a typical Table 1 for statistical report or manuscript
table1 <- tabmulti(dataset = d, xvarname = "Group",
                   yvarnames = c("Age", "Sex", "Race", "BMI"))
                   
# Create vector of race labels for use in regression tables
races <- c("White", "Black", "Mexican American", "other")

# Test whether age, sex, race, and treatment group are associated with BMI
glmfit1 <- glm(BMI ~ Age + Sex + Race + Group, data = d)
lintable <- tabglm(glmfit = glmfit1, 
                   xlabels = c("Intercept", "Age", "Male", "Race", races, "Treatment"))

# Test whether age, sex, race, and treatment group are associated with 1-year mortality
glmfit2 <- glm(death_1yr ~ Age + Sex + Race + Group, data = d, family = binomial)
logtable <- tabglm(glmfit = glmfit2, ci.beta = FALSE,
                   xlabels = c("Intercept", "Age", "Male", "Race", races, "Treatment"))

# Test whether age, sex, race, and treatment group are associated with survival
coxtable <- tabcox(x = d[,c("Age", "Sex", "Race", "Group")], time = d$time, 
                   delta = d$delta, 
                   xlabels = c("Age", "Male", "Race", races, "Treatment"))

# Click on freqtable, meanstable, table1, lintable, logtable, or coxtable in 
# the Workspace tab of RStudio to see the tables that could be copied and pasted 
# into a Word document. With newer versions of RStudio, it works better to 
# set the print.html input to TRUE, and then copy the table from the .html file
# that prints to your current working directory. Alternatively, setting the latex 
# input to TRUE produces tables that can be inserted into LaTeX using the xtable 
# package.



