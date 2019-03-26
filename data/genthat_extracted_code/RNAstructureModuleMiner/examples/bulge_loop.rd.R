library(RNAstructureModuleMiner)


### Name: bulge_loop
### Title: Get bulge loops in a RNA secondary structure
### Aliases: bulge_loop

### ** Examples

###Create a RNA secondary structure
col1 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
col2 <- c("G","C","C","A","C","C","C","U","G","C","A","G","G","G","U","C","G","G","C")
col3 <- c(0,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18)
col4 <- c(2,3,4,5,6,7,8,9,0,11,12,13,14,15,16,17,18,19,0)
col5 <- c(19,18,17,15,14,13,12,11,10,9,8,7,6,5,4,0,3,2,1)
col6 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)
data <- matrix(c(col1,col2,col3,col4,col5,col6),byrow=FALSE,ncol =6)
###Compute bulge loops in the RNA secondary structure
bulge_loop(data)



