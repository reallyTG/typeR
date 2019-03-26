library(growthcurver)


### Name: SummarizeGrowthByPlate
### Title: Summarize Growth Curves
### Aliases: SummarizeGrowthByPlate

### ** Examples

#Get the summary metrics for the entire plate of sample data provided
#with the Growthcurver package

#First, load the example data provided with Growthcurver. Note that there is
#a column named "time" -- this is necessary for Growthcurver to know which
#column contains the time measurements. In this dataset, the repeated
#measurements from a single well in a plate are given in a column of data.

myPlate <- growthdata
names(myPlate)

#Next, do the analysis for all the columns.
summary_plate <- SummarizeGrowthByPlate(plate = myPlate)

#The output is a data frame that contains the information on the best
#fit for each column of data.
head(summary_plate)      # Use head to display just the first few rows




