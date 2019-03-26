library(NCA)


### Name: nca_analysis
### Title: Run NCA analyses on a data set
### Aliases: nca_analysis
### Keywords: functions

### ** Examples

# Load the data
data(nca.example)
data <- nca.example

# Basic NCA analysis, with independent variables in the first 2 columns
# and the dependent variable in the third column
model <- nca_analysis(data, c(1, 2), 3)

# Use nca_output to show the summaries (see nca_output documentation for more options)
nca_output(model)

# Columns can be selected by name as well
model <- nca_analysis(data, c('Individualism', 'Risk taking'), 'Innovation performance')

# Define the ceiling techniques via the ceilings parameter, see 'ceilings' for all types
model <- nca_analysis(data, c(1, 2), 3, ceilings=c('ce_fdh', 'ce_vrs'))
# These are the available ceiling techniques
print(ceilings)

# For using the upper right corner(s), 'flip' the x variables
model <- nca_analysis(data, c(1, 2), 3, flip.x=TRUE)
# It is also possible to flip a single x variable
model <- nca_analysis(data, c(1, 2), 3, flip.x=c(TRUE, FALSE))
# Flip the y variable if the lower corners need analysing
model <- nca_analysis(data, c(1, 2), 3, flip.x=c(TRUE, FALSE), flip.y=TRUE)

# Use a theoretical scope instead of the (calculated) empirical scope
model <- nca_analysis(data, c(1, 2), 3, scope=c(0, 120, 0, 240))

# By default the bottleneck tables use percentages of the range for the x and y values.
# Using the percentage of the max value is also possible
model <- nca_analysis(data, c(1, 2), 3, bottleneck.y='percentage.max')
# Use the actual values, in this case the x-value
model <- nca_analysis(data, c(1, 2), 3, bottleneck.x='actual')
# Use percentile, in this case for the y-values
model <- nca_analysis(data, c(1, 2), 3, bottleneck.y='percentile')
# Any combination is possible
model <- nca_analysis(data, c(1, 2), 3, bottleneck.x='actual', bottleneck.y='percentile')

# The number of steps is adjustible via the steps parameter
model <- nca_analysis(data, c(1, 2), 3, steps=20)
# Or via the step.size parameter, this ignores the steps parameter
model <- nca_analysis(data, c(1, 2), 3, step.size=5)

# If the ceiling line crosses the X = Xmax line at a point C below Y = Ymax,
# for Y < Yc < Ymax, the corresponding X in the bottleneck table is displayed as 'NA'
# It is also possible to display them as Xmax
model <- nca_analysis(data, c(1, 2), 3, cutoff=1)
# or as the calculated value on the ceiling line
model <- nca_analysis(data, c(1, 2), 3, cutoff=2)

# To run tests, the test.rep needs to be larger than 0
# Optionally the p_confidence (default 0.95) and the p_threshold (default 0) can be set
# The progress for each independent variable is shown
model <- nca_analysis(data, c(1, 2), 3, test.rep=1000, test.p_confidence=0.9, test.p_threshold=0.05)

# The output of the tests can be shown via nca_output with test=TRUE
nca_output(model, test=TRUE)



