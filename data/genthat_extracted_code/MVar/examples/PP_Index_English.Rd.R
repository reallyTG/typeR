library(MVar)


### Name: PP_Index
### Title: Function to find the Projection Pursuit indexes (PP).
### Aliases: PP_Index
### Keywords: Projection pursuit PP

### ** Examples

data(iris) # data set

Data <- iris[,1:4]

# Example 1 - Without the classes in the data
Ind <- PP_Index(Data = Data, Class = NA, Vector.Proj = NA, 
                Findex = "moment", DimProj = 2, Weight = TRUE, 
                Lambda = 0.1, r = 1)

print("Number of classes:"); Ind$Num.Class
print("Class Names:"); Ind$Class.Names
print("Projection index function:"); Ind$Findex
print("Projection vectors:"); Ind$Vector.Proj  
print("Projection Index:"); Ind$Index


# Example 2 - With the classes in the data
Class <- iris[,5] # data class

FcIndex <- "pda" # index function

Sphere <- TRUE # spherical data

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "SA", DimProj = 2, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 1000, Half = 30)

# Comparing the result obtained
if (match(toupper(FcIndex),c("LDA", "PDA", "LR"), nomatch = 0) > 0) {
  if (Sphere) {
     Data <- apply(predict(prcomp(Data)), 2, scale) # spherical data
  }
} else Data <- as.matrix(Res$Proj.Data[,1:Dim])

Ind <- PP_Index(Data = Data, Class = Class, Vector.Proj = Res$Vector.Opt, 
                Findex = FcIndex, DimProj = 2, Weight = TRUE, Lambda = 0.1,
                r = 1)

print("Number of classes:"); Ind$Num.Class
print("Class Names:"); Ind$Class.Names
print("Projection index function:"); Ind$Findex
print("Projection vectors:"); Ind$Vector.Proj  
print("Projection index:"); Ind$Index
print("Optimized Projection Index:"); Res$Index[length(Res$Index)]



