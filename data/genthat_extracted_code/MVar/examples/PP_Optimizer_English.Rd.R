library(MVar)


### Name: PP_Optimizer
### Title: Optimization function of the Projection Pursuit index (PP).
### Aliases: PP_Optimizer
### Keywords: Projection pursuit PP

### ** Examples

data(iris) # data set

# Example 1 - Without the classes in the data
Data <- iris[,1:4]

Class <- NA # data class

FcIndex <- "kurtosismax" # index function

Dim <- 1 # dimension of data projection

Sphere <- TRUE # spherical data

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 1000, Half = 30)
 
print("Number of classes:"); Res$Num.Class
print("Class Names:"); Res$Class.Names
print("Projection index function:"); Res$Findex
print("Projected data:"); Res$Proj.Data
print("Projection vectors:"); Res$Vector.Opt
print("Projection index:"); Res$Index


# Example 2 - With the classes in the data
Class <- iris[,5] # classe dos dados

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 1000, Half = 30)

print("Number of classes:"); Res$Num.Class
print("Class Names:"); Res$Class.Names
print("Projection index function:"); Res$Findex
print("Projected data:"); Res$Proj.Data
print("Projection vectors:"); Res$Vector.Opt
print("Projection index:"); Res$Index



