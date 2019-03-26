library(Rmpi)


### Name: mpi.dims.create
### Title: MPI\_Dims\_create
### Aliases: mpi.dims.create
### Keywords: interface

### ** Examples

## No test: 
#What is the dim numbers of 2 dim Cartersian topology under a grid of 36 nodes
mpi.dims.create(36,2)	#return c(6,6)
#Constrained dim numbers
mpi.dims.create(12,2,c(0,4)) #return c(9,4)
## End(No test)



