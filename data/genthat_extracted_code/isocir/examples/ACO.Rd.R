library(isocir)


### Name: ACO
### Title: Aggregation of Circular Orders
### Aliases: ACO
### Keywords: circular isotonic order CIRE aggregation

### ** Examples

data(cirgenes)
ACO(cirgenes[,c(1:5)], method="TSP", control.method="alpha3")
#datos<- rbind (c(0, 1/10, 1/9, 1, 11/10, 10/9)*pi,c(0, 1/2, 1/10, 1, 3/2, 11/10)*pi) 
#ACO(datos, method="TSP", control.method="alpha3")




