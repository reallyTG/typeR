library(ExPosition)


### Name: designCheck
### Title: designCheck
### Aliases: designCheck
### Keywords: misc

### ** Examples

	data <- iris[,c(1:4)]
	design <- as.matrix(iris[,c('Species')])
	iris.design <- designCheck(data,DESIGN=design,make_design_nominal=TRUE)



