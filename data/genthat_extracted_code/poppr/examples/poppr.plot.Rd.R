library(poppr)


### Name: poppr.plot
### Title: Internal function to plot the results from ia() and poppr()
### Aliases: poppr.plot
### Keywords: internal

### ** Examples

## Not run: 
##D data(Pinf)
##D x <- Pinf %>% seppop() %>% lapply(ia, sample = 99, valuereturn = TRUE, quiet = TRUE, plot = FALSE)
##D x
##D poppr:::poppr.plot(sample = x, file = "hey") # plots multiple populations
##D # plot.ialist takes care of the single populations.
##D for (i in x){
##D   print(plot(i))
##D }
## End(Not run)




