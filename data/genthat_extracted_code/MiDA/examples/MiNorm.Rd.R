library(MiDA)


### Name: MiNorm
### Title: Microarray data normalization
### Aliases: MiNorm

### ** Examples

data("IMexpression")
# Loess normalization
LoMatrix<-MiNorm(IMexpression, method="Loess")
par(mfrow=c(1,2))
boxplot(log2(IMexpression),main="Before normalization")
boxplot(log2(LoMatrix),main="Loess normalization")
par(mfrow=c(1,1))





