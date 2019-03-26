library(FCMapper)


### Name: comp.scenarios
### Title: Scenario comparison
### Aliases: comp.scenarios

### ** Examples

matrix = matrix(nrow=7,ncol=7)
matrix[1,] = c(0,-0.5,0,0,1,0,1)
matrix[2,] = c(1,0,1,0.2,0,0,0.6)
matrix[3,] = c(0,1,0,0,0,0,0)
matrix[4,] = c(0.6,0,0,1,0,0,0.1)
matrix[5,] = c(0,0.5,0,0,1,0,-0.6) 
matrix[6,] = c(0,0,-1,0,0,0,0)
matrix[7,] = c(0,0,0,-0.5,0,0,1)
concept.names = c("A","B","C","D","E","F","G")

scenario1 = nochanges.scenario(matrix,iter=25,concept.names)

scenario2 = changes.scenario(matrix,concept.names,iter=25,set.concepts=c("B"),set.values=c(0.5))

comp.scenarios(scenario1,scenario2)



