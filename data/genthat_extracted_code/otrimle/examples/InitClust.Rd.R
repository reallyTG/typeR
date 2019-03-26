library(otrimle)


### Name: InitClust
### Title: Robust Initialization for Model-based Clustering Methods
### Aliases: InitClust

### ** Examples

 ## Load  Swiss banknotes data
 data(banknote)
 x <- banknote[,-1]

 ## Initial clusters with default arguments
 init <- InitClust(data = x, G = 2)
 print(init)

 ## Perform otrimle
 a <- otrimle(data = x, G = 2, initial = init,
              logicd = c(-Inf, -50, -10), ncores = 1)
 plot(a, what="clustering", data=x)
 


