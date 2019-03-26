library(poppr)


### Name: ia
### Title: Index of Association
### Aliases: ia pair.ia resample.ia jack.ia

### ** Examples

data(nancycats)
ia(nancycats)

# Pairwise over all loci:
data(partial_clone)
res <- pair.ia(partial_clone)
plot(res, low = "black", high = "green", index = "Ia")

# Resampling
data(Pinf)
resample.ia(Pinf, reps = 99)

## Not run: 
##D 
##D # Pairwise IA with p-values (this will take about a minute)
##D res <- pair.ia(partial_clone, sample = 999)
##D head(res)
##D 
##D # Plot the results of resampling rbarD. 
##D library("ggplot2")
##D Pinf.resamp <- resample.ia(Pinf, reps = 999)
##D ggplot(Pinf.resamp[2], aes(x = rbarD)) +
##D   geom_histogram() +
##D   geom_vline(xintercept = ia(Pinf)[2]) +
##D   geom_vline(xintercept = ia(clonecorrect(Pinf))[2], linetype = 2) +
##D   xlab(expression(bar(r)[d]))
##D 
##D # Get the indices back and plot the distributions.
##D nansamp <- ia(nancycats, sample = 999, valuereturn = TRUE)
##D 
##D plot(nansamp, index = "Ia")
##D plot(nansamp, index = "rbarD")
##D 
##D # You can also adjust the parameters for how large to display the text
##D # so that it's easier to export it for publication/presentations.
##D library("ggplot2")
##D plot(nansamp, labsize = 5, linesize = 2) +
##D   theme_bw() +                                      # adding a theme
##D   theme(text = element_text(size = rel(5))) +       # changing text size
##D   theme(plot.title = element_text(size = rel(4))) + # changing title size
##D   ggtitle("Index of Association of nancycats")      # adding a new title
##D 
##D # Get the index for each population.
##D lapply(seppop(nancycats), ia)
##D # With sampling
##D lapply(seppop(nancycats), ia, sample = 999)
##D 
##D # Plot pairwise ia for all populations in a grid with cowplot
##D # Set up the library and data
##D library("cowplot")
##D data(monpop)
##D splitStrata(monpop) <- ~Tree/Year/Symptom
##D setPop(monpop)      <- ~Tree
##D 
##D # Need to set up a list in which to store the plots.
##D plotlist        <- vector(mode = "list", length = nPop(monpop))
##D names(plotlist) <- popNames(monpop)
##D 
##D # Loop throgh the populations, calculate pairwise ia, plot, and then
##D # capture the plot in the list
##D for (i in popNames(monpop)){
##D   x <- pair.ia(monpop[pop = i], limits = c(-0.15, 1)) # subset, calculate, and plot
##D   plotlist[[i]] <- ggplot2::last_plot() # save the last plot
##D }
##D 
##D # Use the plot_grid function to plot.
##D plot_grid(plotlist = plotlist, labels = paste("Tree", popNames(monpop)))
##D 
## End(Not run)



