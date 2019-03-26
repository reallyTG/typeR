library(AST)


### Name: AST
### Title: Age-Spatio-Temporal Model
### Aliases: AST

### ** Examples

library("AST")

data(data.residual.AST,package="AST")
data.residual <- data.residual.AST[data.residual.AST$sex == 0 ,]

data(data.adjacent.mat,package="AST")
spaceMat <- calcSpaceMat(data.adjacent.mat,par.space=0.9)

AST(data.residual=data.residual,spaceMatrix=spaceMat,par.time = 0.5,
     par.age=1, weight.coverage=0.9, agecat=3, minyear=2000, maxyear=2005)




