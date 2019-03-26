library(CDVineCopulaConditional)


### Name: CDVineCondListMatrices
### Title: List of the possible C- and D- vines allowing for conditional
###   simulation
### Aliases: CDVineCondListMatrices

### ** Examples


# Read data
data(dataset)
data <- dataset$data[1:100,1:5]

# Define the variables Y and X. X are the conditioning variables, 
# which have to be positioned in the last columns of the data.frame
colnames(data) <- c("Y1","Y2","X3","X4","X5")

# List possible D-Vines:
ListVines <- CDVineCondListMatrices(data,Nx=3,"DVine")
ListVines$DVine

# List possible C-Vines:
ListVines <- CDVineCondListMatrices(data,Nx=3,"CVine")
ListVines$CVine

# List possible C- and D-Vines:
ListVines <- CDVineCondListMatrices(data,Nx=3,"CVine-DVine")
ListVines




