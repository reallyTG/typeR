library(FusionLearn)


### Name: fusionbinary
### Title: Fusion learning algorithm for binary responses
### Aliases: fusionbinary fusionbinary.fit

### ** Examples

##Analysis of the gene data 
y = list(mockgene1[,2],mockgene2[,2])           ## responses "status"
x = list(mockgene1[,3:502],mockgene2[,3:502])   ## 500 predictors 


##Implementing fusion learning algorithm 
result <- fusionbinary(x,y,0.3,N=c(98,286),500,2) 
id <- which(result$beta[,1]!=0)+2
genename <- colnames(mockgene1)[id]




