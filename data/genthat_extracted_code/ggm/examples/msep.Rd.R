library(ggm)


### Name: msep
### Title: The m-separation criterion
### Aliases: msep
### Keywords: graphs d-separation m-separation mixed graph

### ** Examples

H <-matrix(c(0,0,0,0,
	         1,0,0,1,
	         0,1,0,0,
	         0,0,0,0),4,4)
msep(H,1,4, 2)
msep(H,1,4, c())



