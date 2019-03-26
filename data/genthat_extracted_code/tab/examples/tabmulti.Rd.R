library(tab)


### Name: tabmulti
### Title: Generate Multi-row Tables Comparing Means/Medians/Frequencies of
###   Multiple Variables Across Levels of One Categorical Variable
### Aliases: tabmulti
### Keywords: table means t-test anova

### ** Examples

# Load in sample dataset d
data(d)

# Compare age, sex, race, and BMI in control vs. treatment group
# data for each comparison
table1 <- tabmulti(dataset = d, xvarname = "Group", 
                   yvarnames = c("Age", "Sex", "Race", "BMI"))
                   
# Repeat, but use all available data for each comparison (as opposed to listwise deletion)
table2 <- tabmulti(dataset = d, xvarname = "Group", n.column = TRUE, n.headings = FALSE,
                   yvarnames = c("Age", "Sex", "Race", "BMI"), listwise.deletion = FALSE)
                   
# Same as table1, but compare medians rather than means for BMI
table3 <- tabmulti(dataset = d, xvarname = "Group", 
                   yvarnames = c("Age", "Sex", "Race", "BMI"), 
                   ymeasures = c("mean", "freq", "freq", "median"))

# Click on table1, table2, or table3 in the Workspace tab of RStudio to see the tables 
# that could be copied and pasted into a report or manuscript. Alternatively, setting 
# the latex input to TRUE produces tables that can be inserted into LaTeX using the 
# xtable package.



