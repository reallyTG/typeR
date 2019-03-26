library(ElastH)


### Name: decompor
### Title: Estimacao de componentes do Filtro de Kalman
### Aliases: decompor

### ** Examples

seriey <- ts(runif(76), start=1997, end=c(2015,4), frequency=4)

## No test: 
 decomposicao <- decompor(seriey) 
## End(No test) #Decomposição sem variável independente

seriex <- ts(runif(76), start=1997, end=c(2015,4), frequency=4)
## No test: 
 modelo <- decompor(seriey, seriex) 
## End(No test) #Decomposição e estimação de coeficente

#Decomposição e estimação com nível e inclinacao fixos e sem sazonalidade
## No test: 
 modelo2 <- decompor(seriey, seriex, nivel="F", inclinacao="F", sazon="N") 
## End(No test)
#Decomposição e estimação com coeficente constante
## No test: 
 modelo3 <- decompor(seriey, seriex, regres="F") 
## End(No test)
#Decomposição e estimação usando apenas um subconjunto dos dados
## No test: 
 modelo4 <- decompor(seriey, seriex, comeco=2000, fim=2010) 
## End(No test)
#Decomposição e estimação sem a detecção de intervenções
## No test: 
 modelo5 <- decompor(seriey, seriex, interv.b=F) 
## End(No test)



