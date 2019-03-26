library(mcMST)


### Name: getExactFront
### Title: Enumerate all Pareto-optimal solutions.
### Aliases: getExactFront

### ** Examples

# here we enumerate all Pareto-optimal solutions of a bi-objective mcMST problem
# we use the Pruefer-code enumerator. Thus, we need to define an objective
# function, which is able to handle this type of endcoding
objfunMCMST = function(pcode, instance) {
  getWeight(instance, prueferToEdgeList(pcode))
}

# next we generate a random bi-objective graph
g = genRandomMCGP(5L)

# ... and finally compute the exact front of g
res = getExactFront(g, obj.fun = objfunMCMST, enumerator.fun = enumerateMST, n.objectives = 2L)
## Not run: 
##D plot(res$pareto.front)
## End(Not run)



