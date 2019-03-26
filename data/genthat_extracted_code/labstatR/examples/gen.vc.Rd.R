library(labstatR)


### Name: gen.vc
### Title: Simula una variabile casuale discreta
### Aliases: gen.vc
### Keywords: distribution

### ** Examples

x <- c(-2,3,7,10,12)
p <- c(0.2, 0.1, 0.4, 0.2, 0.1) 
y <- NULL
for(i in 1:1000) y <- c(y,gen.vc(x,p))
table(y)/length(y)



