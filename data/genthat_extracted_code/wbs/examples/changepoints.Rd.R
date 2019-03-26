library(wbs)


### Name: changepoints
### Title: Change-points detected by WBS or BS
### Aliases: changepoints changepoints.sbs changepoints.wbs

### ** Examples

#we generates  gaussian noise + Poisson process signal with 10 jumps on average
set.seed(10)
N <- rpois(1,10)
true.cpt <- sample(1000,N)
m1 <- matrix(rep(1:1000,N),1000,N,byrow=FALSE)
m2 <- matrix(rep(true.cpt,1000),1000,N,byrow=TRUE)
x <- rnorm(1000) + apply(m1>=m2,1,sum)

# we apply  the BS and WBS algorithms with default values for their parameters

s <- sbs(x)
w <- wbs(x)

s.cpt <- changepoints(s)
s.cpt

w.cpt <- changepoints(w)
w.cpt

#we can use different stopping criteria, invoking sbs/wbs functions is not necessary

s.cpt <- changepoints(s,th.const=c(1,1.3))
s.cpt
w.cpt <- changepoints(w,th.const=c(1,1.3))
w.cpt



