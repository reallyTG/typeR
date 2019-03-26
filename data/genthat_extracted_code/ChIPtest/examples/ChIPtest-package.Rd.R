library(ChIPtest)


### Name: ChIPtest_1.0-package
### Title: Nonparametric Methods for Identifying Differential Enrichment
###   Regions with ChIP-seq Data
### Aliases: ChIPtest_1.0-package ChIPtest_1.0
### Keywords: ChIPtest, nonparametric test, ChIP-seq, differential
###   enrichment

### ** Examples

data(data1)
data(data4)
Data1=NormTransformation(data1)
Data4=NormTransformation(data4)
tao=est.c(Data1, Data4, max1=5, max4=5)
band=54
TS=TS_twosample(Data1, Data4, tao, band, quant=c(0.9,0.9,0.9))



