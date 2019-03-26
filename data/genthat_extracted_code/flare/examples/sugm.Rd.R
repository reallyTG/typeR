library(flare)


### Name: sugm
### Title: High-deimensional Sparse Undirected Graphical Models.
### Aliases: sugm

### ** Examples


## load package required
library(flare)

## generating data
n = 50
d = 50
D = sugm.generator(n=n,d=d,graph="band",g=1)
plot(D)

## sparse precision matrix estimation with method "clime"
out1 = sugm(D$data, method = "clime")
plot(out1)
sugm.plot(out1$path[[4]])

## sparse precision matrix estimation with method "tiger"
out2 = sugm(D$data, method = "tiger")
plot(out2)
sugm.plot(out2$path[[5]])



