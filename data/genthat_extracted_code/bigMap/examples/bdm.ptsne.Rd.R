library(bigMap)


### Name: bdm.ptsne
### Title: Parallelized t-SNE
### Aliases: bdm.ptsne

### ** Examples


# --- load example dataset
bdm.example()
# --- perform ptSNE
## Not run: 
##D exMap <- bdm.ptsne(exMap, threads = 10, layers = 2, rounds = 2, ppx = 200)
## End(Not run)
# --- plot the Cost function
bdm.cost(exMap)
# --- plot ptSNE output
bdm.plot(exMap)



