library(lessR)


### Name: Regression
### Title: Regression Analysis
### Aliases: Regression reg reg.brief
### Keywords: regression

### ** Examples

# read internal data set
d <- rd("Reading", in.lessR=TRUE, quiet=TRUE)
# do not need all this data, so take only 30% to reduce CPU time
d <- Subset(random=.3)

# one-predictor regression
# Provide all default analyses including scatterplot etc.
# Can abbreviate Regression with reg
Regression(Reading ~ Verbal)
# Provide only the brief analysis on the standardized variables
reg.brief(Reading ~ Verbal, standardize=TRUE)

# Access the pieces of output, here in an object named \code{r}
r <- reg(Reading ~ Verbal + Absent + Income)
# Display all output at the console in the standard sequence
r
# list the names of all the saved components
names(r)
# Display just the estimated coefficients and their inferential analysis
r$out_estimates

# Generate an R markdown file with the option: Rmd
# Output file here will be read.Rmd, a simple text file that can
#   be edited with any text editor including RStudio from which it
#   can be knit to generate dynamic output to a Word document,
#   pdf file or html file
reg(Reading ~ Verbal + Absent, Rmd="read")

# just for incomes > 100000 and less than 5 days absent 
Regression(Reading ~ Verbal, rows=(Income > 100 & Absent < 5))

# Multiple regression model
# Save the three output plots as pdf files 4 inches square
Regression(Reading ~ Verbal + Absent + Income, pdf=TRUE,
   width=4, height=4)

# Compare nested models
# Reduced model:  Reading ~ Verbal
# Full model:  Reading ~ Verbal + Income + Absent
Nest(Reading, Verbal, c(Income, Absent))

# Specify new values of the predictor variables to calculate
#  forecasted values and the corresponding prediction intervals
# Specify an input data frame other than d, see help(mtcars)
Regression(mpg ~ hp + wt, data=mtcars,
  X1.new=seq(50,350,50), X2.new=c(2,3))

# Indicator (dummy) variable
d <- Read("Employee", in.lessR=TRUE, quiet=TRUE)
reg(Salary ~ Dept)



