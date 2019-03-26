library(sysid)


### Name: idpoly
### Title: Polynomial model with identifiable parameters
### Aliases: idpoly

### ** Examples

# define output-error model
mod_oe <- idpoly(B=c(0.6,-0.2),F1=c(1,-0.5),ioDelay = 2,Ts=0.1,
noiseVar = 0.1)

# define box-jenkins model with unit variance
B <- c(0.6,-0.2)
C <- c(1,-0.3)
D <- c(1,1.5,0.7)
F1 <- c(1,-0.5)
mod_bj <- idpoly(1,B,C,D,F1,ioDelay=1)




