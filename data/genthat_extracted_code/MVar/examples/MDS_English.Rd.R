library(MVar)


### Name: MDS
### Title: Multidimensional Scaling (MDS).
### Aliases: MDS
### Keywords: Multidimensional Scaling MDS

### ** Examples

data(DataQuan) # set of quantitative data

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

MD <- MDS(Data, Distance = "euclidean", Axis = TRUE, Title = NA,
          xlabel = NA, ylabel = NA, Color = TRUE, LinLab = NA)
          
print("Matrix of the distances:"); MD$MatrixD



