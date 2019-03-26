library(NCA)


### Name: NCA-package
### Title: Necessary Condition Analysis
### Keywords: package

### ** Examples

# A more detailed guide can be found here : http://repub.eur.nl/pub/78323/
# or https://ssrn.com/abstract=2624981

# Load data from a CSV file with header and row names:
## No test: 
## Don't show: 
try(
## End(Don't show)data <- read.csv('mydata.csv', row.names=1)## Don't show: 
, silent=TRUE)
## End(Don't show)
## End(No test)
# Or load the example dataset
data(nca.example)
data <- nca.example

# Run NCA with the dataset.
# Specify the independent (cause) and dependent (effect) variables
# More than 1 independent variables can be specified with a vector
model <- nca_analysis(data, c(1, 2), 3)

# A quick summary can be displayed by printing the model
model

# A full summary is shown by nca_output (see documentation for more options)
nca_output(model)

# The model is a list of 6 items :
# - plots (1 for each independent variable)
# - summaries (1 for each independent variable)
# - bottleneck tables (1 for each ceiling technique)
# - peers (1 dataframe for each independent variable)
# - tests (1 list for each independent variabl)
# - test.time (total time to run all tests)
names(model)

# The first item contains the graphical outputs for each independent variable
# This is not really useful to humans
model$plots[[1]]

# The seconds item contains a list with the summaries for the independent variables
model$summaries[[1]]

# The third item contains a list with the bottleneck tables, one for each ceiling technique
model$bottlenecks$cr_fdh

# The fourth item shows the peers, for each independent variable
model$peers$Individualism

# For the fifth and sixth item, the test.rep needs to be bigger than 0
# Optionally the p_confidence (default 0.95) and the p_threshold (default 0) can be set
model <- nca_analysis(data, c(1, 2), 3, test.rep=100)

# The fifth item shows the tests for each independent variable
# This is not really useful to humans
model$tests$Individualism

# The last item shows the total time needed to perform the tests
model$test.time



