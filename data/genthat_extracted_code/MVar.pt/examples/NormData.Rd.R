library(MVar.pt)


### Name: NormData
### Title: Normaliza os dados.
### Aliases: NormData
### Keywords: Normaliza dados

### ** Examples

data(DataQuan) # conjunto de dados quantitativos

Data <- DataQuan[,2:8]

Resp = NormData(Data, Type = 1) # normaliza os dados globalmente

Resp # dados normalizados globalmente

sd(Resp)   # desvio padrao global

mean(Resp) # media global


Resp = NormData(Data, Type = 2) # normaliza os dados por coluna

Resp # dados normalizados por coluna

apply(Resp, 2, sd) # desvio padrao por coluna

colMeans(Resp)     # medias das colunas



