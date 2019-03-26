library(akmeans)


### Name: norm.sim.ksc
### Title: K-means algorithm based on cosine distance
### Aliases: norm.sim.ksc

### ** Examples

###############
## test code
## 4 classes: a1,a2,a3,a4
## for each class, 20 samples
###############
n = 20; p = 32
a1 = 10*sin(0.1*(1:p))
a2 = 10*cos(0.1*(1:p))+10
a3 = c(1:(p/2),(p/2):1)
a4 = c((p/2):1,1:(p/2))
A = c()
for (i in 1:n){
  A = rbind(A,a1+rnorm(p),a2+rnorm(p),a3+rnorm(p),a4+rnorm(p))
}
res = norm.sim.ksc(quick.norm(A,1),4)



