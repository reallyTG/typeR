library(umx)


### Name: umx_is_MxModel
### Title: umx_is_MxModel
### Aliases: umx_is_MxModel

### ** Examples

m1 = mxModel("test")
if(umx_is_MxModel(m1)){
	message("nice OpenMx model!")
}
if(umx_is_MxModel(list(m1,m1), listOK = TRUE)){
	message("nice list of OpenMx models!")
}



