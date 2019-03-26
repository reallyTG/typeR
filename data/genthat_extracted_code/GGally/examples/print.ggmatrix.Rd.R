library(GGally)


### Name: print.ggmatrix
### Title: Print ggmatrix object
### Aliases: print.ggmatrix

### ** Examples

 data(tips, package = "reshape")
 pMat <- ggpairs(tips, c(1,3,2), mapping = ggplot2::aes_string(color = "sex"))
 pMat # calls print(pMat), which calls print.ggmatrix(pMat)



