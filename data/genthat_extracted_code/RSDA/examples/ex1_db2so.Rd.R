library(RSDA)


### Name: ex1_db2so
### Title: Data example to generate symbolic objets
### Aliases: ex1_db2so
### Keywords: datasets

### ** Examples

data(ex1_db2so)
ex1 <- ex1_db2so
result <- classic.to.sym(ex1, concept=c('state', 'sex'),
                         variables = c(county, group, age, age),
                         variables.types = c(county = type.continuous(),
                         group = type.histogram(),
                         age = type.histogram(),
                          age = type.set()))
result



