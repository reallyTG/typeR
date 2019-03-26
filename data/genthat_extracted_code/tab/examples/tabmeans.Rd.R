library(tab)


### Name: tabmeans
### Title: Generate Summary Tables of Mean Comparisons for Statistical
###   Reports
### Aliases: tabmeans
### Keywords: table means t-test anova

### ** Examples

# Load in sample dataset d and drop rows with missing values
data(d)
d <- d[complete.cases(d), ]

# Compare mean BMI in control group vs. treatment group - table and figure
meanstable1 <- tabmeans(x = d$Group, y = d$BMI)
meansfig1 <- tabmeans(x = d$Group, y = d$BMI, fig = TRUE)

# Compare mean BMI by race - table and figure
meanstable2 <- tabmeans(x = d$Race, y = d$BMI)
meansfig2 <- tabmeans(x = d$Race, y = d$BMI, fig = TRUE)

# Compare mean baseline systolic BP across tertiles of BMI - table and figure
meanstable3 <- tabmeans(x = d$BMI, y = d$bp.1, yname = "Systolic BP", quantiles = 3)
meansfig3 <- tabmeans(x = d$BMI, y = d$bp.1, quantiles = 3, fig = TRUE, 
                      yname = "Systolic BP", xname = "BMI Tertile")

# Create single table comparing mean BMI and mean age in control vs. treatment group
meanstable4 <- rbind(tabmeans(x = d$Group, y = d$BMI), tabmeans(x = d$Group, y = d$Age))
                     
# An easier way to make the above table is to call the tabmulti function
meanstable5 <- tabmulti(dataset = d, xvarname = "Group", yvarnames = c("BMI", "Age"))
                        
# meanstable4 and meanstable5 are equivalent
all(meanstable4 == meanstable5)

# Click on meanstable 1, ... , meanstable5 in the Workspace tab of RStudio to see the 
# tables that could be copied and pasted into a report. Alternatively, setting the latex 
# input to TRUE produces tables that can be inserted into LaTeX using the xtable package.



