library(MVar)


### Name: Cluster
### Title: Cluster Analysis.
### Aliases: Cluster
### Keywords: Cluster Analysis Cluster

### ** Examples

data(DataQuan) # set of quantitative data

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

Res <- Cluster(Data, Hierarquico = TRUE, Analise = "Obs", CorAbs = FALSE, 
               Normaliza = FALSE, Distance = "euclidean", Method = "ward.D", 
               Horizontal = FALSE, NumGrupos = 2)

print("Table with similarities and distances:"); Res$TabRes
print("Groups formed:"); Res$Groups
print("Table with the results of the groups:"); Res$ResGroups
print("Total sum of squares:"); Res$SQT
print("Distance Matrix:"); Res$MatrixD 
 
write.table(file=file.path(tempdir(),"SimilarityTable.csv"), Res$TabRes, sep=";",
            dec=",",row.names = FALSE) 
write.table(file=file.path(tempdir(),"GroupedData.csv"), Res$Groups, sep=";",
            dec=",",row.names = TRUE) 
write.table(file=file.path(tempdir(),"GroupResults.csv"), Res$ResGroups, sep=";",
            dec=",",row.names = TRUE) 



