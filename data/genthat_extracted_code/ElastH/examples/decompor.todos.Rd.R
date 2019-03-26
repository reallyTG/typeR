library(ElastH)


### Name: decompor.todos
### Title: Estimação de alternativas hipoteses
### Aliases: decompor.todos

### ** Examples

seriey <- ts(runif(96), start=1997, end=c(2015,4), frequency=4)
# Estimar modelo sem variáveis indepedentes
## No test: 
 lista.dlm <- decompor.todos(seriey) 
## End(No test)

seriex <- ts(runif(96), start=1997, end=c(2015,4), frequency=4)
# Estimar modelos incluindo variável independente
## No test: 
 lista.dlm2 <- decompor.todos(y=seriey, X=seriex) 
## End(No test)
# Estimar modelo, com variavel dependente, mas restringindo o escopo temporal
## No test: 
 lista.dlm3 <- decompor.todos(y=seriey, X=seriex, comeco=2000, fim=2014) 
## End(No test)



