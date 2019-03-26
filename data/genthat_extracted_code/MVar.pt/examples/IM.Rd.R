library(MVar.pt)


### Name: IM
### Title: Matriz indicadora.
### Aliases: IM
### Keywords: Variaveis dummy Matriz indicadora

### ** Examples

Data <- matrix(c("S","S","N","N",1,2,3,4,"N","S","T","N"), nrow = 4, ncol = 3)

IM(Data, Names = FALSE) 

data(DataQuali) # conjunto de dados qualitativos

IM(DataQuali, Names = TRUE)



