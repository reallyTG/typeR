library(RFOC)


### Name: hudson.net
### Title: Hudson Net Plot
### Aliases: hudson.net
### Keywords: misc

### ** Examples

hudson.net()

Mtens <- c(-0.412, 0.084, 0.328 ,0.398, -1.239, 1.058)

M1 <-  matrix(c(Mtens[1], Mtens[4], Mtens[5], Mtens[4],
Mtens[2], Mtens[6], Mtens[5],Mtens[6], Mtens[3]), ncol=3, nrow=3,
byrow=TRUE)

E1 <-  eigen(M1)

hudson.plot(E1$values)






