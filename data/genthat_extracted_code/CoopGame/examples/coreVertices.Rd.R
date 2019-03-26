library(CoopGame)


### Name: coreVertices
### Title: Compute core vertices
### Aliases: coreVertices

### ** Examples

library(CoopGame)
coreVertices(c(0,0,0,1,1,1,3))

## No test: 
#In the following case the core consists of a single point
v1 = c(0,1,2,3,4,5,6)
coreVertices(v1)
#     [,1] [,2] [,3]
#[1,]    1    2    3

#Users may also want to try the following commands:
coreVertices(c(0,0,0,60,80,100,135))
coreVertices(c(5,2,4,7,15,15,15,15,15,15,20,20,20,20,35))
coreVertices(c(0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,15,15,15,15,15,15,15,15,15,15,30,30,30,30,30,60))
## End(No test)




