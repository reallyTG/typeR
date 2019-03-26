library(lavaan)


### Name: varTable
### Title: Variable Table
### Aliases: varTable vartable variableTable variabletable

### ** Examples

HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)
varTable(fit)



