library(MVar.pt)


### Name: GrandTour
### Title: Tecnica de animacao Grand Tour.
### Aliases: GrandTour
### Keywords: Grand Tour

### ** Examples

data(iris) # conjunto de dados

Data <- as.data.frame(NormData(iris[,1:4], 2))

Res <- GrandTour(Data, Method = "Interpolation", Title = NA, Color = TRUE,
                 Label = FALSE, LinLab = NA, AxisVar = TRUE, Axis = TRUE,
                 NumRot = 10, ChoiceRot = NA, SavePicture = FALSE)

print("Dados projetados:"); Res$Proj.Data
print("Vetores de projecao:"); Res$Vector.Opt
print("Metodo da projecao Grand Tour:"); Res$Method




