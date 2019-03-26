library(ChIPtest)


### Name: est.c
### Title: calculate the biologically relevant value c in the null
###   hypothesis H0: TS=c, in assumption-free nonparametric test
### Aliases: est.c

### ** Examples

data(data1)
data(data4)
Data1=NormTransformation(data1)
Data4=NormTransformation(data4)
tao=est.c(Data1, Data4, max1=5, max4=5)



