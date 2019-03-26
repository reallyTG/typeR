library(tfplot)


### Name: tsScan
### Title: Read and Write Time Series to Files
### Aliases: tsScan tsWrite
### Keywords: ts

### ** Examples


z <- ts(matrix(100 + rnorm(200),100,2), start=c(1991,1), frequency=4)
tsWrite(z, file="tmp.test.data.csv")
zz <- tsScan("tmp.test.data.csv", nseries=2)

max(abs(z - zz)) 



