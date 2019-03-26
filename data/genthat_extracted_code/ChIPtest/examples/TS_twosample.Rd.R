library(ChIPtest)


### Name: TS_twosample
### Title: Three Nonparametric Test Statistics for two sample ChIP-seq data
### Aliases: TS_twosample

### ** Examples

data(data1)
data(data4)
Data1=NormTransformation(data1)
Data4=NormTransformation(data4)
tao=est.c(Data1, Data4, max1=5, max4=5)
band=54
TS=TS_twosample(Data1, Data4, tao, band, quant=c(0.9,0.9,0.9))



