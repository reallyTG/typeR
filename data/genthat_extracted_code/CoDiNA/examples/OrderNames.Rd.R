library(CoDiNA)


### Name: OrderNames
### Title: OrderNames
### Aliases: OrderNames

### ** Examples

Nodes = LETTERS[1:10]
Z = data.frame(Node.1 = sample(Nodes) ,
Node.2 = sample(Nodes), cor = runif(10,-1,1))
OrderNames(Z)



