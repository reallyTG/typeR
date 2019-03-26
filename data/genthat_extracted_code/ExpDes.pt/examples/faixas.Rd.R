library(ExpDes.pt)


### Name: faixas
### Title: Experimentos em faixas
### Aliases: faixas

### ** Examples

data(ex5)
attach(ex5)
faixas(trat, genero, bloco, sabor, quali=c(TRUE,TRUE), mcomp="tukey", 
 fac.names=c("Amostras","Genero"), sigT = 0.05, sigF = 0.05)



