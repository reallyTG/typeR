library(CDVineCopulaConditional)


### Name: CDVineCondFit
### Title: Selection of a C- or D- vine copula model for conditional
###   sampling
### Aliases: CDVineCondFit

### ** Examples


# Example 1

# Read data 
data(dataset) 
data <- dataset$data[1:100,1:5]

# Define the variables Y and X. X are the conditioning variables, 
# which have to be positioned in the last columns of the data.frame
colnames(data) <- c("Y1","Y2","X3","X4","X5")

## Not run: 
##D # Select and fit a C- vine copula model, requiring that the 
##D RVM <- CDVineCondFit(data,Nx=3,treecrit="BIC",type="CVine",selectioncrit="AIC")
##D summary(RVM)
##D RVM$Matrix
## End(Not run)



# Example 2

# Read data 
data(dataset) 
data <- dataset$data[1:80,1:5]

# Define the variables Y and X. X are the conditioning variables, 
# which have to be positioned in the last columns of the data.frame
colnames(data) <- c("Y1","Y2","X3","X4","X5")

# Define a VineMatrix which can be used for conditional sampling
ListVines <- CDVineCondListMatrices(data,Nx=3)
Matrix=ListVines$DVine[[1]]
Matrix

## Not run: 
##D # Fit copula families for the defined vine:
##D RVM <- CDVineCondFit(data,Nx=3,Matrix=Matrix)
##D summary(RVM)
##D RVM$Matrix
##D RVM$family
##D 
##D # check
##D identical(RVM$Matrix,Matrix)
##D 
##D # Fit copula families for the defined vine, given a group of families to select from:
##D RVM <- CDVineCondFit(data,Nx=3,Matrix=Matrix,familyset=c(1,2,3,14))
##D summary(RVM)
##D RVM$Matrix
##D RVM$family
##D 
##D # Try to fit copula families for a vine which is not among those 
##D # that allow for conditional sampling:
##D Matrix
##D Matrix[which(Matrix==4)]=40
##D Matrix[which(Matrix==2)]=20
##D Matrix[which(Matrix==40)]=2
##D Matrix[which(Matrix==20)]=4
##D Matrix
##D RVM <- CDVineCondFit(data,Nx=3,Matrix=Matrix)
##D RVM
## End(Not run)




