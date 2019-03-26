library(POET)


### Name: POET
### Title: Principal Orthogonal ComplEment Thresholding (POET) method
### Aliases: POET

### ** Examples

p=100
n=100
Y<-array(rnorm(p*n),dim=c(p,n))
Sy<-POET(Y,3,0.5,'soft','vad')$SigmaY
Su<-POET(Y,3,0.5,'soft','vad')$SigmaU
F<-POET(Y,3,0.5,'soft','vad')$factors
B<-POET(Y,3,0.5,'soft','vad')$loadings




