library(Haplin)


### Name: plot.haptable
### Title: Plot a haptable object
### Aliases: plot.haptable

### ** Examples

## Not run: 
##D 
##D # Directly plotting the haplin result. Produce separate plots for child and mother, 
##D # dump plots to files:
##D res <- haplin("data.dat", use.missing = T, maternal = T)
##D plot(res, separate.plots = T, filename = "Haplinres.png")
##D 
##D # Create haptable from the haplin result and plot the results in the table:
##D res <- haplin("data.dat", use.missing = T, maternal = T)
##D tab <- haptable(res)
##D plot(tab)
##D 
##D # Create haptables for the 10 first markers of a data file using haplinSlide. 
##D # Create plots for each result:
##D res <- haplinSlide("data.dat", markers = 1:10, use.missing = T, maternal = T, table.output = T)
##D lapply(res, plot)
## End(Not run)


