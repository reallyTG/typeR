library(CDVineCopulaConditional)


### Name: dataset
### Title: Random dataset from a given vine copula model
### Aliases: dataset
### Keywords: datasets

### ** Examples


# Load data
data(dataset)

# Extract data
data <- dataset$data 
plot(data)

# Extract the RVineMatrix object from where the dataset was randomly sampled
vine <- dataset$vine
vine$Matrix 
vine$family
vine$par
vine$par2 
summary(vine)






