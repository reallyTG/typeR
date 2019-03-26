library(ElastH)


### Name: calcular.elasticidades
### Title: Calculo elasticidades de todos os grupos de receitas
### Aliases: calcular.elasticidades

### ** Examples

## Not run: data(Exemplo)
## No test: 
resultado <- calcularElasticidades(Exemplo$receitas, 
                         Exemplo$Hpib, Exemplo$Hpet, c(2015,4))
## End(No test)

receitas <- ts(matrix(runif(836), nrow=76, ncol=11), start=1997,
                  end=c(2015,4), frequency=4)
Hpib <- ts(runif(76), start=1997, end=c(2015,4), frequency=4)
Hpet <- ts(runif(76), start=1997, end=c(2015,4), frequency=4)
## No test: 
resultado <- calcularElasticidades(receitas, Hpib, Hpet, fim=c(2015,4))
## End(No test) 



