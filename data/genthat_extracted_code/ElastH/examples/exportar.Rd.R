library(ElastH)


### Name: exportar
### Title: Exportacao de resultado
### Aliases: exportar

### ** Examples

## Not run: data(Exemplo)
## No test: 
resultado <- calcular.elasticidades(Exemplo$receitas, Exemplo$Hpib, Exemplo$Hpet, fim=c(2015,4))
## End(No test)

## No test: 
resultado.exportacao <- exportar(resultado)
## End(No test)
## No test: 
write.csv2(resultado.exportacao, "/tmp/dados.csv")
## End(No test) #Escreve resultados em arquivo CSV.



