library(emstreeR)


### Name: plotMST3D
### Title: 3D Minimum Spanning Tree Plot
### Aliases: plotMST3D

### ** Examples


## 3D artificial data:
n1 = 12
n2 = 22
n3 = 7
n = n1+n2+n3
set.seed(1984)

mean_vector <- sample(seq(1, 10, by=2), 3)
sd_vector <- sample(seq(0.01, 0.8, by=0.01), 3)
c1 <- matrix(rnorm(n1*3,mean=mean_vector[1],sd=.3), n1, 3)
c2 <- matrix(rnorm(n2*3,mean=mean_vector[2],sd=.5), n2, 3)
c3 <- matrix(rnorm(n3*3,mean=mean_vector[3],sd=1), n3, 3)
d<-rbind(c1, c2, c3)

## MST:
out <- ComputeMST(d)

## 3D PLOT:
plotMST3D(out)




