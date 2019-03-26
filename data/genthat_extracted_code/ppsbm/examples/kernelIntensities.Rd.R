library(ppsbm)


### Name: kernelIntensities
### Title: Direct kernel estimator intensities
### Aliases: kernelIntensities

### ** Examples


# The generated_sol_kernel was generated calling mainVEM with kernel method on the generated_Q3 data
# (50 individuals and 3 clusters)

data <- generated_Q3$data

n <- 50
Q <- 3


# compute smooth intensity estimators
sol.kernel.intensities <- kernelIntensities(data,generated_sol_kernel$tau,Q,n,directed=FALSE)




