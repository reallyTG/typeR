library(dgmb)


### Name: IntPar
### Title: Calculating internal parameters
### Aliases: IntPar

### ** Examples

r.s <- matrix(c(0,0,0,1,
                0,0,0,1,
                0,0,0,1,
                1,1,1,0),4,4,byrow=TRUE)
		   
r.ie <- matrix(c(0,0,1,				
                 0,1,0,				
                 1,0,0),3,3,byrow=TRUE)

modo <- c("F","F","F","F")

bv <- c(2,2,2,2)

intpar <- IntPar(r.s,r.ie,modo,bv)

attributes(intpar)



