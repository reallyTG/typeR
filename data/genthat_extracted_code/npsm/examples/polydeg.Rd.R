library(npsm)


### Name: polydeg
### Title: Degree of Polynomial Determination
### Aliases: polydeg

### ** Examples

 x <- 1:20
 xc <- x - mean(x)
 y<- .2*xc + xc^3 +rt(20,3)*90
 plot(y~x)
 polydeg(y,xc,6)




