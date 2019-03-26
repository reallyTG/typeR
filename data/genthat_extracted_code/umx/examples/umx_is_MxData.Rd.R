library(umx)


### Name: umx_is_MxData
### Title: Check if an object is an mxData object
### Aliases: umx_is_MxData

### ** Examples

umx_is_MxData(mtcars)
umx_is_MxData(mxData(mtcars, type= "raw"))
umx_is_MxData(mxData(cov(mtcars), type= "cov", numObs = 73))



