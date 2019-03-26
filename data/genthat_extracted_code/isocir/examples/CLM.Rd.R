library(isocir)


### Name: CLM
### Title: Circular Local Minimization
### Aliases: CLM
### Keywords: circular isotonic order CLM aggregation

### ** Examples

data(cirgenes)
aggre_order <- ACO(cirgenes[,c(1:5)], method="TSP", control.method="time")$TSP_order[1,]
CLM(cirgenes[,c(1:5)], order0 = c(1:5))
#datos<- rbind (c(0, 1/10, 1/9, 1, 11/10, 10/9)*pi,c(0, 1/2, 1/10, 1, 3/2, 11/10)*pi) 
#CLM(datos, order0 = c(1:6))



