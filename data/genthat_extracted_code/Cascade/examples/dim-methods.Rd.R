library(Cascade)


### Name: dim
### Title: Dimension of the data
### Aliases: dim dim-methods dim,micro_array-method
### Keywords: methods

### ** Examples

  if(require(CascadeData)){
	data(micro_US)
	micro_US<-as.micro_array(micro_US,time=c(60,90,210,390),subject=6)
	dim(micro_US)
	}



