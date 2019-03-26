library(MVar.pt)


### Name: Plot.CA
### Title: Graficos da analise de correspondencia (CA) simples e multipla.
### Aliases: Plot.CA
### Keywords: Analise de correspondencia CA

### ** Examples

data(DataFreq) # conjunto de dados de frequencia

Data <- DataFreq[,2:ncol(DataFreq)]

rownames(Data) <- DataFreq[1:nrow(DataFreq),1]

Resp <- CA(Data, "f") # realiza CA

Tit = c("Scree-plot","Observacoes", "Variaveis", "Observacoes/Variaveis")

Plot.CA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
        Color = TRUE, LinLab = NA, Casc = FALSE)


data(DataQuali) # conjunto de dados qualitativos

Data <- DataQuali[,2:ncol(DataQuali)]

Resp <- CA(Data, "c", "b") # realiza CA

Tit = c("","","Grafico das Variaveis")

Plot.CA(Resp, Titles = Tit, xlabel = NA, ylabel = NA,
        Color = TRUE, LinLab = NA, Casc = FALSE)




