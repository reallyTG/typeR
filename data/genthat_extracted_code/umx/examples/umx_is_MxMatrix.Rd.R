library(umx)


### Name: umx_is_MxMatrix
### Title: umx_is_MxMatrix
### Aliases: umx_is_MxMatrix

### ** Examples

x = mxMatrix(name = "eg", type = "Full", nrow = 3, ncol = 3, values = .3)
if(umx_is_MxMatrix(x)){
	message("nice OpenMx matrix!")
}



