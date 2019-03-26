library(CDVineCopulaConditional)


### Name: overplot
### Title: overplot
### Aliases: overplot

### ** Examples


# Example 1

# Read and prepare the data for the plot
data(dataset) 
data1 <- dataset$data[1:300,]
data2 <- dataset$data[301:600,]
overplot(data1,data2,xlim=c(0,1),ylim=c(0,1),method="kendall")



## Not run: 
##D # Example 2
##D 
##D # Read and prepare the data for the plot
##D data(dataset) 
##D data <- dataset$data[1:200,1:5]
##D colnames(data) <- c("Y1","Y2","X3","X4","X5")
##D 
##D # Fit copula families for the defined vine:
##D ListVines <- CDVineCondListMatrices(data,Nx=3)
##D Matrix=ListVines$CVine[[1]]
##D RVM <- CDVineCondFit(data,Nx=3,Matrix=Matrix)
##D 
##D # Simulate data:
##D d=dim(RVM$Matrix)[1]
##D cond1 <- data[,RVM$Matrix[(d+1)-1,(d+1)-1]]
##D cond2 <- data[,RVM$Matrix[(d+1)-2,(d+1)-2]]
##D cond3 <- data[,RVM$Matrix[(d+1)-3,(d+1)-3]]
##D condition <- cbind(cond1,cond2,cond3)
##D Sim <- CDVineCondSim(RVM,condition)
##D 
##D # Plot the simulated variables Sim over the observed
##D Sim <- data.frame(Sim)
##D overplot(data[,1:2],Sim[,1:2],xlim=c(0,1),ylim=c(0,1),method="spearman")
##D overplot(data,Sim,xlim=c(0,1),ylim=c(0,1),method="spearman")
## End(Not run)




