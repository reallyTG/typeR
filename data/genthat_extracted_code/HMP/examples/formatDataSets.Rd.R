library(HMP)


### Name: formatDataSets
### Title: Format Data
### Aliases: formatDataSets

### ** Examples

	data(saliva)
	data(throat)
	
	### Set each data set to have 10 different columns
	saliva2 <- saliva[,1:10]
	throat2 <- throat[,11:20]
	
	### Combine the data sets into a single list
	group.data <- list(saliva2, throat2)
	
	formattedData <- formatDataSets(group.data)
	formattedData[[1]][1:5, 1:5]



