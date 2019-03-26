library(MVar.pt)


### Name: Biplot
### Title: Grafico Biplot.
### Aliases: Biplot
### Keywords: Biplot

### ** Examples

data(DataQuan) # conjunto de dados quantitativos

Data <- DataQuan[,2:ncol(DataQuan)]
rownames(Data) <- DataQuan[,1]

Biplot(Data)

LinNames <- paste("C",1:nrow(Data), sep="")
Biplot(Data, alpha = 0.6, Title = "Biplot dos Dados\n valorizando os individuos",
       xlabel = "Eixo X", ylabel = "Eixo Y", Color = TRUE, Obs = TRUE, 
       LinLab = LinNames)
       
Biplot(Data, alpha = 0.4, Title = "Grafico valorizando as variaveis",
       xlabel = "", ylabel = "", Color = FALSE, Obs = FALSE)



