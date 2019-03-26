library(MVar.pt)


### Name: Plot.CCA
### Title: Graficos da analise de correlacao canonica (CCA).
### Aliases: Plot.CCA
### Keywords: Analise de correlacao canonica CCA

### ** Examples

data(DataMix) # conjunto de dados

Data <- DataMix[,2:ncol(DataMix)]

rownames(Data) <- DataMix[,1]

X <- as.data.frame(NormData(Data[,1:2],2))

Y <- as.data.frame(NormData(Data[,5:6],2))

Resp <- CCA(X, Y, Type = 1, Test = "Bartlett", Sign = 0.05) # Analise de correlacao canonica

Tit = c("Scree-plot","Correlacoes","Scores do grupo X","Scores do grupo Y")

Plot.CCA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
         Color = TRUE, Casc = TRUE)



