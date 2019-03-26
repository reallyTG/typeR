library(npmlda)


### Name: LocalLm
### Title: Local linear fit with Epanechnikov kernel
### Aliases: LocalLm

### ** Examples

data(BMACS)
Time.int<- seq(0.1,5.9,  by=0.1)
LocalFit.Y <- with(BMACS, LocalLm(Time.int, Time, CD4, bw=0.9, Wt=1))



