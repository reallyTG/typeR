library(MVar.pt)


### Name: Cluster
### Title: Analise de cluster.
### Aliases: Cluster
### Keywords: Analise de Cluster Cluster

### ** Examples

data(DataQuan) # conjunto de dados quantitativos

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

Res <- Cluster(Data, Hierarquico = TRUE, Analise = "Obs", CorAbs = FALSE, 
       Normaliza = FALSE, Distance = "euclidean", Method = "ward.D", 
       Horizontal = FALSE, NumGrupos = 2)

print("Tabela com as similaridades e distancias:"); Res$TabRes
print("Grupos formados:"); Res$Groups
print("Tabela com os resultados dos grupos:"); Res$ResGroups
print("Soma do quadrado total:"); Res$SQT
print("Matriz de distancias:"); Res$MatrixD 

write.table(file="TabelaSimilaridade.csv", Res$TabRes, sep=";",dec=",",row.names = FALSE) 
write.table(file="DadosAgrupados.csv", Res$Groups, sep=";",dec=",",row.names = TRUE) 
write.table(file="ResultadosGrupos.csv", Res$ResGroups, sep=";",dec=",",row.names = TRUE) 



