library(MVar.pt)


### Name: MDS
### Title: Escalonamento multidimensional (MDS).
### Aliases: MDS
### Keywords: Escalonamento Multidimensional MDS

### ** Examples

data(DataQuan) # conjunto de dados quantitativos

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

MD <- MDS(Data, Distance = "euclidean", Axis = TRUE, Title = NA,
          xlabel = NA, ylabel = NA, Color = TRUE, LinLab = NA)

print("Matriz das distancias:"); MD$MatrixD



