library(MVar.pt)


### Name: Plot.FA
### Title: Graficos da analise fatorial (FA).
### Aliases: Plot.FA
### Keywords: Analise Fatorial FA

### ** Examples

data(DataQuan) # conjunto de dados

Data <- DataQuan[,2:ncol(DataQuan)]

rownames(Data) <- DataQuan[,1]

Resp <- FA(Data, Method = "PC", Type = 2, NFactor = 3)

Tit = c("Scree-plot","Scores das observacoes","Cargas Fatoriais","Biplot")

Plot.FA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
        Color = TRUE, LinLab = rep("", nrow(Data)),
        Casc = TRUE)




