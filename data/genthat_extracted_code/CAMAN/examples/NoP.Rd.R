library(CAMAN)


### Name: NoP
### Title: Ames test data: Mutagenicity of 4NoP
### Aliases: NoP
### Keywords: datasets

### ** Examples

data(NoP)
ames3 <- mixcov(dep="count",fixed=c("dose", "logd"),random="",data=NoP,
                k=3,family="poisson")



