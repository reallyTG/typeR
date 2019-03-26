library(multigroup)


### Name: mbmgPCA
### Title: multiblock and multigroup Principal Component Analysis
### Aliases: mbmgPCA

### ** Examples

data(wine)
Select=c(which(wine[,2]=="Env1"),which(wine[,2]=="Env2"),which(wine[,2]=="Reference"))
WineData = wine[Select,-c(1,2)]
Group <- as.factor(c(rep("Env1",7), rep("Env2",5), rep("Reference",7)))
nBlock <- c(5, 3, 10, 9)
BlockNames    <- c("Olfaction at rest", "Vision", "Olfaction  after shaking", "Taste")
res = mbmgPCA(Data = WineData, Group, nBlock , ncomp=5)



