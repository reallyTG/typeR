library(tab)


### Name: tabglm
### Title: Generate Summary Tables of Fitted Generalized Linear Models for
###   Statistical Reports
### Aliases: tabglm
### Keywords: table generalized linear model

### ** Examples

# Load in sample dataset d and drop rows with missing values
data(d)
d <- d[complete.cases(d), ]

# Create labels for race levels
races <- c("White", "Black", "Mexican American", "Other")

# Test whether age, sex, race, and treatment group are associated with BMI
glmfit1 <- glm(BMI ~ Age + Sex + Race + Group, data = d)
lintable <- tabglm(glmfit = glmfit1, 
                   xlabels = c("Intercept", "Age", "Male", "Race", races, "Treatment"))

# Test whether age, sex, race, and treatment group are associated with 1-year mortality
glmfit2 <- glm(death_1yr ~ Age + Sex + Race + Group, data = d, family = binomial)
logtable <- tabglm(glmfit = glmfit2, ci.beta = FALSE,
                   xlabels = c("Intercept", "Age", "Male", "Race", races, "Treatment"))

# Click on lintable or logtable in the Workspace tab of RStudio to see the tables that 
# could be copied and pasted into a report or manuscript. Alternatively, setting the
# latex input to TRUE produces tables that can be inserted into LaTeX using the xtable 
# package.



