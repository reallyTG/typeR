library(abn)


### Name: plotabn
### Title: Plot an ABN graphic
### Aliases: plotabn
### Keywords: models

### ** Examples

#Define distribution list
dist<-list(a="gaussian",b="gaussian",c="gaussian",d="gaussian", e="binomial", f="binomial")

#Define a matrix formulation
arc.strength <- matrix(data = c(0,0.5,0.5,0.7,0.1,0,
                              0,0,0.3,0.1,0,0.8,
                              0,0,0,0.35,0.66,0,
                              0,0,0,0,0.9,0,
                              0,0,0,0,0,0.8,
                              0,0,0,0,0,0),nrow = 6L,ncol = 6L,byrow = TRUE)

#Naming of the matrix
colnames(arc.strength)<-rownames(arc.strength)<-names(dist)
colnames(arc.strength)<-rownames(arc.strength)<-names(dist)

#Plot from a formula
plotabn(dag.m = ~a|b:c:e+b|c:d:f+e|f,data.dist = dist)

#Plot form a matrix
plotabn(dag.m = arc.strength,data.dist = dist)

#Creating adjency matrix
plotabn(dag.m = ~a|b:c:e+b|c:d:f+e|f,data.dist = dist,plot = FALSE)

#Arc strength
plotabn(dag.m = ~a|b:c:e+b|c:d:f+e|f,data.dist = dist,arc.strength = arc.strength)

#Markov blanket
plotabn(dag.m = ~a|b:c:e+b|c:d:f+e|f,data.dists = dist,markov.blanket.node = "e")



