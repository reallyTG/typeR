library(conting)


### Name: formula2index
### Title: Convert Between Formula and Index
### Aliases: formula2index index2formula

### ** Examples

data(ScotPWID)
## Load the ScotPWID data

maximal.mod<-glm(y~(S1+S2+S3+S4+Region+Gender+Age)^2,family=poisson,contrasts=list(
S1="contr.sum",S2="contr.sum",S3="contr.sum",S4="contr.sum",
Region="contr.sum",Gender="contr.sum",Age="contr.sum"),data=ScotPWID,x=TRUE)
## Fit the maximal model containing all two-way interactions.

big.X<-maximal.mod$x
## Set the design matrix under the maximal model

index<-formula2index(big.X=big.X,
formula=~S1+S2+S3+S4+Region+Gender+Age+S1:S2+S1:Age+S2:Gender+S3:S4+S4:Age,
data=ScotPWID)
## Find the index under the model with the following interactions:
## S1:S2
## S1:Age
## S2:Gender
## S3:S4
## S4:Age

index
## Print index
# [1] 1 1 1 1 1 1 1 1 1 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 0 1 0 0 0

index2formula(index=index,maximal.mod=maximal.mod)
## Go back to formula
#y ~ S1 + S2 + S3 + S4 + Region + Gender + Age + S1:S2 + S1:Age + 
#    S2:Gender + S3:S4 + S4:Age



