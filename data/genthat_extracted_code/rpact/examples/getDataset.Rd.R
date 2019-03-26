library(rpact)


### Name: getDataset
### Title: Get Dataset
### Aliases: getDataset

### ** Examples


# Create a Dataset of Means (one group):

datasetOfMeans <- getDataset(
	   n = c(22, 11, 22, 11),
	   means = c(1, 1.1, 1, 1),
	   stDevs = c(1, 2, 2, 1.3)
)
datasetOfMeans
datasetOfMeans$show(showType = 2)

datasetOfMeans <- getDataset(
	   overallSampleSizes = c(22, 33, 55, 66),
	   overallMeans = c(1.000, 1.033, 1.020, 1.017 ),
	   overallStDevs = c(1.00, 1.38, 1.64, 1.58)
)
datasetOfMeans
datasetOfMeans$show(showType = 2)
as.data.frame(datasetOfMeans)

# Create a Dataset of Means (two groups):

datasetOfMeans <- getDataset(
	   n1 = c(22, 11, 22, 11),
	   n2 = c(22, 13, 22, 13),
	   means1 = c(1, 1.1, 1, 1),
	   means2 = c(1.4, 1.5, 3, 2.5),
	   stDevs1 = c(1, 2, 2, 1.3),
	   stDevs2 = c(1, 2, 2, 1.3)
)
datasetOfMeans

datasetOfMeans <- getDataset(
	   overallSampleSizes1 = c(22, 33, 55, 66),
	   overallSampleSizes2 = c(22, 35, 57, 70),
	   overallMeans1 = c(1, 1.033, 1.020, 1.017),
	   overallMeans2 = c(1.4, 1.437, 2.040, 2.126),
	   overallStDevs1 = c(1, 1.38, 1.64, 1.58),
	   overallStDevs2 = c(1, 1.43, 1.82, 1.74)
)
datasetOfMeans

df <- data.frame(
	   stages = 1:4,
	   n1 = c(22, 11, 22, 11),
	   n2 = c(22, 13, 22, 13),
	   means1 = c(1, 1.1, 1, 1),
	   means2 = c(1.4, 1.5, 3, 2.5),
	   stDevs1 = c(1, 2, 2, 1.3),
	   stDevs2 = c(1, 2, 2, 1.3)
)
datasetOfMeans <- getDataset(df)
datasetOfMeans

## Create a Dataset of Rates (one group):

datasetOfRates <- getDataset(
	   n = c(8, 10, 9, 11), 
	   events = c(4, 5, 5, 6)
)
datasetOfRates

## Create a Dataset of Rates (two groups):

datasetOfRates <- getDataset(
	   n2 = c(8, 10, 9, 11),
	   n1 = c(11, 13, 12, 13),
	   events2 = c(3, 5, 5, 6),
	   events1 = c(10, 10, 12, 12)
)
datasetOfRates


## Create a Survival Dataset

dataset <- getDataset(
    overallEvents = c(8, 15, 19, 31),
	   overallAllocationRatios = c(1, 1, 1, 2),
	   overallLogRanks = c(1.52, 1.98, 1.99, 2.11)
)
dataset




