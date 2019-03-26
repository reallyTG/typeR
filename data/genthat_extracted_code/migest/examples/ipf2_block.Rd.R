library(migest)


### Name: ipf2_block
### Title: Iterative Proportional Fitting Routine for the Indirect
###   Estimation of Origin-Destination-Type Migration Flow Tables with
###   Known Origin and Destination Margins and Block Diagonal Elements.
### Aliases: ipf2_block

### ** Examples

y <- ipf2_block(rtot= c(30,20,30,10,20,5,0,10,5,5,5,10),
                ctot = c(45,10,10,5,5,10,50,5,10,0,0,0),
                btot = matrix(data = c(0,0 ,50,0, 35,0,25,0, 10,10,0,0, 10,10,0,0),
                              nrow = 4, byrow = TRUE),
                block = block_matrix(x = 1:16, b = c(2,3,4,3)))
addmargins(y$mu)



