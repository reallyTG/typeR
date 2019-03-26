library(rv)


### Name: rvnsims
### Title: Number of simulations stored in each component of an rv object
### Aliases: rvnsims rvnsims.rv rvnsims.rvsummary setnsims getnsims
### Keywords: classes

### ** Examples


  #
  rvnsims(1.23)             # 1
  x <- rvnorm(1)            # an rv
  rvnsims(x)                # equal to setnsims()
  rvnsims(x)==nrow(sims(x)) # TRUE
  rvnsims(x)==getnsims()    # TRUE
  setnsims(1000)            # set n.sims to 1000
  n.sims <- setnsims(10000) # s is now 1000
  print(getnsims())         # prints 10000
  setnsims(n.sims)          # restore the number of simulations back to 1000




