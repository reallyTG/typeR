library(ChIPtest)


### Name: TS_kernel
### Title: Calculate the Test Statistics for kernel-based nonparametric
###   test.
### Aliases: TS_kernel

### ** Examples

data(data1)
data(data4)
Data1=NormTransformation(data1)
Data4=NormTransformation(data4)
data=Data4-Data1
band=54
TS=TS_kernel(data, band, quantile=0.9)




