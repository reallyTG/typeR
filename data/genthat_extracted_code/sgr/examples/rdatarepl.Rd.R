library(sgr)


### Name: rdatarepl
### Title: Random replacements of data.
### Aliases: rdatarepl
### Keywords: utility

### ** Examples

require(MASS)
set.seed(20130207)
Dx <- rdatagen(R=matrix(c(1,.3,.3,1),2,2),Q=5)$data
RM <- replacement.matrix(p=c(.6,0))
Fx <- rdatarepl(Dx,RM)$Fx

par(mfrow=c(2,2))
for (j in 1:ncol(Dx)) barplot(table(Dx[,j]),main="original data")
for (j in 1:ncol(Fx)) barplot(table(Fx[,j]),main="replaced data")



