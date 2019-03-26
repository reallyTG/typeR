library(otvPlots)


### Name: vlm
### Title: Create over time variable plots and summary statistics for
###   variable level monitoring
### Aliases: vlm

### ** Examples

## Load the data and its label
data(bankData)
data(bankLabels)

## The PrepData function should only need to be run once on a dataset, 
## after that vlm can be run with the argument dataNeedPrep = FALSE
bankData <- PrepData(bankData, dateNm = "date", dateGp = "months", 
                    dateGpBp = "quarters")
bankLabels <- PrepLabels(bankLabels)

## Not run: 
##D  
##D vlm(dataFl = bankData, dateNm = "date", labelFl = bankLabels, 
##D     sortFn = "OrderByR2", dateGp = "months", dateGpBp = "quarters", 
##D     outFl = "bank")
##D     
##D ## If csv files of summary statistics are not need, set genCSV = FALSE
##D vlm(dataFl = bankData, dateNm = "date", labelFl = bankLabels, genCSV = FALSE,
##D     sortFn = "OrderByR2", dateGp = "months", dateGpBp = "quarters", 
##D     outFl = "bank")
##D     
##D ## If weights are provided, they will be used in all statistical calculations
##D bankData[, weight := rnorm(.N, 1, .1)]
##D vlm(dataFl = bankData, dateNm = "date", labelFl = bankLabels,
##D     dateGp = "months", dateGpBp = "quarters", weightNm = "weight", 
##D     outFl = "bank")
##D 
##D ## Customize plotting order by passing a vector of variable names to 
##D ## sortVars, but the "date" column must be excluded from sortVars
##D sortVars <- sort(bankLabels[varCol!="date", varCol])
##D vlm(dataFl = bankData, dateNm = "date", labelFl = bankLabels, 
##D     dateGp = "months", dateGpBp = "quarters", outFl = "bank", 
##D     sortVars = sortVars)
##D             
##D ## Create plots for a specific variable using the varNms parameter
##D vlm(dataFl = bankData, dateNm = "date", labelFl = bankLabels, 
##D     dateGp = "months", dateGpBp = "quarters", outFl = "bank", 
##D     varNms = "age", sortVars = NULL)
## End(Not run)



