library(spatstat)


### Name: pool.fasp
### Title: Pool Data from Several Function Arrays
### Aliases: pool.fasp
### Keywords: spatial htest hplot iteration

### ** Examples

   data(amacrine)
   A1 <- alltypes(amacrine,"K",nsim=9,envelope=TRUE,savefuns=TRUE)
   A2 <- alltypes(amacrine,"K",nsim=10,envelope=TRUE,savefuns=TRUE)
   pool(A1, A2)



