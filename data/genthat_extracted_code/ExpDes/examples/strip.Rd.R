library(ExpDes)


### Name: strip
### Title: Strip-plot experiments
### Aliases: strip

### ** Examples

data(ex5)
attach(ex5)
strip(trat, genero, bloco, sabor, quali=c(TRUE,TRUE), mcomp="tukey", 
 fac.names=c("Amostras","Genero"), sigT = 0.05, sigF = 0.05)



