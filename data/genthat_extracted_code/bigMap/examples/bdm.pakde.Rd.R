library(bigMap)


### Name: bdm.pakde
### Title: Perplexity-adaptive kernel density estimation
### Aliases: bdm.pakde

### ** Examples


# --- load mapped dataset
bdm.example()
# --- run paKDE
## Not run: 
##D exMap <- bdm.pakde(exMap, threads = 4, ppx = 200, g = 200, g.exp = 3)
## End(Not run)
# --- plot paKDE output
bdm.plot(exMap)



