library(RFOC)


### Name: hudson.plot
### Title: Hudson Source Type Plot
### Aliases: hudson.plot
### Keywords: misc

### ** Examples

hudson.net()

Mtens <- c(-0.412, 0.084, 0.328 ,0.398, -1.239, 1.058)

M1 <- matrix(c(Mtens[1], Mtens[4], Mtens[5], Mtens[4],
Mtens[2], Mtens[6], Mtens[5],Mtens[6],
Mtens[3]), ncol=3, nrow=3, byrow=TRUE)

E1 <-  eigen(M1)

hudson.plot(E1$values)





