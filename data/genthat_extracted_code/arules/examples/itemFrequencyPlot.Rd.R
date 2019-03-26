library(arules)


### Name: itemFrequencyPlot
### Title: Creating a Item Frequencies/Support Bar Plot
### Aliases: itemFrequencyPlot itemFrequencyPlot,itemMatrix-method
### Keywords: hplot

### ** Examples

data(Adult)

## the following example compares the item frequencies
## of people with a large income (boxes) with the average in the data set
Adult.largeIncome <- Adult[Adult %in% 
	"income=large"]

## simple plot
itemFrequencyPlot(Adult.largeIncome)

## plot with the averages of the population plotted as a line 
## (for first 72 variables/items)
itemFrequencyPlot(Adult.largeIncome[, 1:72], 
	population = Adult[, 1:72])

## plot lift ratio (frequency in x / frequency in population)
## for items with a support of 20% in the population
itemFrequencyPlot(Adult.largeIncome, 
        population = Adult, support = 0.2, 
	lift = TRUE, horiz = TRUE)



