library(NCA)


### Name: nca
### Title: Run a basic NCA analyses on a data set
### Aliases: nca
### Keywords: functions

### ** Examples

# Load the data
data(nca.example)
data <- nca.example

# Basic NCA analysis
# Independent variables in the first 2 columns, dependent variable in the third column
# This shows scatter plot(s) with the ceiling lines and the effect size(s) on the console
nca(data, c(1, 2), 3)

# Columns can be selected by name as well
nca(data, c('Individualism', 'Risk taking'), 'Innovation performance')

# Define the ceiling techniques via the ceilings parameter
nca(data, c(1, 2), 3, ceilings=c('ols', 'ce_vrs'))
# These are the available ceiling techniques
print(ceilings)



