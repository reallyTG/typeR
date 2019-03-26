library(RNAstructureModuleMiner)


### Name: plot_hairpin
### Title: plot_hairpin
### Aliases: plot_hairpin

### ** Examples

###
col1 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13)
col2 <- c("G","A","C","U","G","G","G","G","C","G","G","U","C")
col3 <- c(0,1,2,3,4,5,6,7,8,9,10,11,12)
col4 <- c(2,3,4,5,6,7,8,9,10,11,12,13,0)
col5 <- c(13,12,11,10,9,0,0,0,5,4,3,2,1)
col6 <- c(1,2,3,4,5,6,7,8,9,10,11,12,13)
data_1 <- matrix(c(col1,col2,col3,col4,col5,col6),byrow=FALSE,ncol = 6)
plot_hairpin(data_1)



