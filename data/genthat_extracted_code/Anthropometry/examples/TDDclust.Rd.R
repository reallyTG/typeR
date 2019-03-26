library(Anthropometry)


### Name: TDDclust
### Title: Trimmed clustering based on L1 data depth
### Aliases: TDDclust
### Keywords: array

### ** Examples

#In the interests of simplicity of the computation involved, only 15 points are selected:
dataTDDcl <- sampleSpanishSurvey[1 : 15, c(2, 3, 5)]  
dataTDDcl_aux <- sampleSpanishSurvey[1 : 15, c(2, 3, 5)]

numClust <- 3 ; alpha <- 0.01 ; lambda <- 0.5 ; niter <- 2
Th <- 0 ; T0 <- 0 ; simAnn <- 0.9  

set.seed(2014)
res_TDDcl <- TDDclust(dataTDDcl, numClust, lambda, Th, niter, T0, simAnn, 
                      alpha, dataTDDcl_aux,FALSE) 

prototypes <- anthrCases(res_TDDcl)

table(res_TDDcl$NN[1,]) 
res_TDDcl$Cost
res_TDDcl$klBest

trimmed <- trimmOutl(res_TDDcl)



