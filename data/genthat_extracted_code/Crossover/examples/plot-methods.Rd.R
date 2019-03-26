library(Crossover)


### Name: plot
### Title: Plots information about the search algorithm and its process.
### Aliases: plot plot,CrossoverSearchResult,missing-method

### ** Examples


## Not run: 
##D x <- searchCrossOverDesign(s=9, p=5, v=4, model=4)
##D plot(x)
## End(Not run)

x <- searchCrossOverDesign(s=9, p=5, v=4, model=4, n=c(50,10), jumps=c(10, 10))
plot(x, show.jumps=TRUE)
plot(x, type=2)




