library(extracat)


### Name: itab
### Title: Independence Table
### Aliases: itab

### ** Examples

A <- optile(arsim(4000,c(13,17),4,0.1),iter=10)
fluctile(A)
fluctile(itab(A))
D <- A-itab(A)
G <- (D)^2/itab(A)
fluctile(G, tile.col = c(2,4)[1+ (D>0)])




