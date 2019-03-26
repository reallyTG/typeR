library(touchard)


### Name: Touchard
### Title: The Touchard Distribution
### Aliases: Touchard dtouch ptouch qtouch rtouch tau

### ** Examples

for(N in c(2, 5, 10, 20, 50)) print( tau(lambda=7, delta=-1, N) )
tau(lambda=7, delta=-1)
dtouch(0:10, lambda=7, delta=-1)
ptouch(0:10, lambda=7, delta=-1)
qtouch(c(.1,.25,.5,.75,.9), lambda=7, delta=-1)
rtouch(10, lambda=7, delta=-1)



