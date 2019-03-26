library(hyper2)


### Name: Ops.hyper2
### Title: Arithmetic Ops Group Methods for hyper2 objects
### Aliases: Ops.hyper2 Ops hyper2_add hyper2_equality hyper2_prod
###   hyper2_sum_numeric sum.hyper2
### Keywords: symbolmath

### ** Examples


stopifnot(hyper2(list(1,1:2),1:2)==hyper2(list(1:2,1),2:1))  # stl map class
stopifnot(hyper2(list(1,1:2),1:2)==hyper2(list(1,c(1,1,2)),1:2)) # stl set class


n <- 4
H <- hyper2(d=n)
for(i in seq_len(30)){
  jj <- sample(seq_len(n),sample(n,1),replace=FALSE)
  H[jj] <- H[jj] + 1   
}


## without pnames:
x1 <- hyper2(list(1,1:2,1:3),1:3)
x2 <- hyper2(list(4,5),10:11)
x1+x2

## Same as above, but with pnames:
y1 <- hyper2(list(1,1:2,1:3),1:3,pnames=letters[1:3])
y2 <- hyper2(list(4,5),10:11,pnames=letters[1:5])
## Not run: y1+y2  # fails, pnames not identical 

pnames(y1) <- letters[1:5]
y1+y2







