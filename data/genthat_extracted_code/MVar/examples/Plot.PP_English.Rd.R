library(MVar)


### Name: Plot.PP
### Title: Graphics of the Projection Pursuit (PP).
### Aliases: Plot.PP
### Keywords: Projection pursuit PP

### ** Examples

data(iris) # dataset

# Example 1 - Without the classes in the data
Data <- iris[,1:4]

FcIndex <- "kurtosismax" # index function

Dim <- 1 # dimension of data projection

Sphere <- TRUE # spherical data

Res <- PP_Optimizer(Data = Data, Class = NA, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)
    
Plot.PP(Res, Titles = NA, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = NA, AxisVar = TRUE, Axis = TRUE,
        Casc = FALSE)


# Example 2 - With the classes in the data
Class <- iris[,5] # data class

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)

Tit <- c(NA,"Graph example") # titles for the graphics

Plot.PP(Res, Titles = Tit, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = Class, AxisVar = TRUE, Axis = TRUE,
        Casc = FALSE)
        

# Example 3 - Without the classes in the data, but informing 
#             the classes in the plot function
Res <- PP_Optimizer(Data = Data, Class = NA, Findex = "Moment",
                    OptMethod = "GTSA", DimProj = 2, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)

Class <- c(rep("a",50),rep("b",50),rep("c",50)) # data class

Plot.PP(Res, Titles = NA, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = Class, AxisVar = TRUE, Axis = TRUE,
        Casc = FALSE)
        

# Example 4 - With the classes in the data, but not informed in plot function
Class <- iris[,5] # data class

Dim <- 2 # dimension of data projection

FcIndex <- "lda" # index function

Res <- PP_Optimizer(Data = Data, Class = Class, Findex = FcIndex,
                    OptMethod = "GTSA", DimProj = Dim, Sphere = Sphere, 
                    Weight = TRUE, Lambda = 0.1, r = 1, Cooling = 0.9, 
                    Eps = 1e-3, Maxiter = 500, Half = 30)

Tit <- c("",NA) # titles for the graphics

Plot.PP(Res, Titles = Tit, PosLeg = 1, BoxLeg = FALSE, Color = TRUE,
        Label = FALSE, LinLab = NA, AxisVar = TRUE, Axis = TRUE,
        Casc = FALSE)



