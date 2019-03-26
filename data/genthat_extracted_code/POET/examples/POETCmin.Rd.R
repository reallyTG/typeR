library(POET)


### Name: POETCmin
### Title: Cmin - Minimum threshold constant
### Aliases: POETCmin

### ** Examples

p=100
n=50
Y<-array(rnorm(p*n),dim=c(p,n))
C<-POETCmin(Y,3,'soft','vad')



