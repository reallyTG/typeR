library(SeqMADE)


### Name: nbGLM
### Title: Identify Differential Expression Modules Based on the
###   Generalized Linear Model
### Aliases: nbGLM
### Keywords: nbGLM

### ** Examples

data(exprs)
data(networkModule)
case <- c("A1","A2","A3","A4","A5","A6","A7")
control <- c("B1","B2","B3","B4","B5","B6","B7")
factors <- Factor(exprs, case, control) 
modulematrix <- moduleMatrix(exprs,networkModule)
Result <- nbGLM(factors, 14, networkModule, modulematrix, distribution = "NB")



