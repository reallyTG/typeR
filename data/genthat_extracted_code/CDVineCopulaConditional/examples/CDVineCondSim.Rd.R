library(CDVineCopulaConditional)


### Name: CDVineCondSim
### Title: Simulation from a conditional C- or D-vine
### Aliases: CDVineCondSim

### ** Examples


# Example 1: conditional sampling from a C-Vine

# Read data
data(dataset) 
data <- dataset$data[1:400,1:4]

# Define the variables Y and X. X are the conditioning variables, 
# which have to be positioned in the last columns of the data.frame
colnames(data) <- c("Y1","Y2","X3","X4")

## Not run: 
##D # Select a vine and fit the copula families, specifying that there are 2 conditioning variables
##D RVM <- CDVineCondFit(data,Nx=2,type="CVine")
##D 
##D # Set the values of the conditioning variables as those used for the calibration. 
##D # Order them with respect to RVM$Matrix, considering that is a C-Vine
##D d=dim(RVM$Matrix)[1]
##D cond1 <- data[,RVM$Matrix[(d+1)-1,(d+1)-1]]
##D cond2 <- data[,RVM$Matrix[(d+1)-2,(d+1)-2]]
##D condition <- cbind(cond1,cond2)
##D 
##D # Simulate the variables
##D Sim <- CDVineCondSim(RVM,condition)
##D 
##D # Plot the simulated variables over the observed
##D Sim <- data.frame(Sim)
##D overplot(Sim,data)
##D 
##D 
##D 
##D # Example 2: conditional sampling from a D-Vine
##D 
##D # Read data
##D data(dataset) 
##D data <- dataset$data[1:100,1:4]
##D 
##D # Define the variables Y and X. X are the conditioning variables, 
##D # which have to be positioned in the last columns of the data.frame
##D colnames(data) <- c("Y1","Y2","X3","X4")
##D 
##D # Select a vine and fit the copula families, specifying that there are 2 conditioning variables
##D RVM <- CDVineCondFit(data,Nx=2,type="DVine")
##D summary(RVM) #It is a D-Vine.
##D 
##D # Set the values of the conditioning variables as those used for the calibration. 
##D # Order them with respect to RVM$Matrix, considering that is a D-Vine.
##D cond1 <- data[,RVM$Matrix[1,1]]
##D cond2 <- data[,RVM$Matrix[2,2]]
##D condition <- cbind(cond1,cond2)
##D 
##D # Simulate the variables
##D Sim <- CDVineCondSim(RVM,condition)
##D 
##D # Plot the simulated variables over the observed
##D Sim <- data.frame(Sim)
##D overplot(Sim,data)
##D 
##D 
##D 
##D # Example 3
##D 
##D # Read data
##D data(dataset) 
##D data <- dataset$data[1:100,1:2]
##D colnames(data) <- c("Y1","X2")
##D 
##D # Fit copula
##D require(VineCopula)
##D BiCop <- BiCopSelect(data$Y1,data$X2)
##D BiCop
##D 
##D # Fix conditioning variable to low values and simulate
##D condition <- data$X2/10
##D Sim <- CDVineCondSim(BiCop,condition)
##D 
##D # Plot the simulated variables over the observed
##D Sim <- data.frame(Sim)
##D overplot(Sim,data)
## End(Not run)




