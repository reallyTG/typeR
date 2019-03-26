library(MVar.pt)


### Name: Plot.PCA
### Title: Graficos da analise de componentes principais (PCA).
### Aliases: Plot.PCA
### Keywords: Analise de componentes principais PCA

### ** Examples

data(DataQuan) # conjunto de dados quantitativos

Data <- DataQuan[,2:8]

rownames(Data) <- DataQuan[1:nrow(DataQuan),1]

PC <- PCA(Data, 2) # executa o PCA

Tit = c("Scree-plot","Grafico das Observacoes","Circulo de Correlacoes")

Plot.PCA(PC, Titles = Tit, xlabel = NA, ylabel = NA,
         Color = TRUE, LinLab = NA, Casc = TRUE)



