library(MVar)


### Name: GrandTour
### Title: Animation technique Grand Tour.
### Aliases: GrandTour
### Keywords: Grand Tour

### ** Examples

data(iris) # database

Data <- as.data.frame(NormData(iris[,1:4],2))

Res <- GrandTour(Data, Method = "Interpolation", Title = NA, Color = TRUE,
                 Label = FALSE, LinLab = NA, AxisVar = TRUE, Axis = TRUE,
                 NumRot = 10, ChoiceRot = NA, SavePicture = FALSE)

print("Projected data:"); Res$Proj.Data
print("Projection vectors:"); Res$Vector.Opt
print("Grand Tour projection method:"); Res$Method




