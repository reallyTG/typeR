library(stream)


### Name: animation
### Title: Animates the plotting of a DSD and the clustering process
### Aliases: animate animation animate_data animate_cluster

### ** Examples

## Not run: 
##D stream <- DSD_Benchmark(1)
##D animate_data(stream, horizon=100, n=5000, xlim=c(0,1), ylim=c(0,1))
##D 
##D ### animations can be replayed with the animation package
##D library(animation)
##D animation::ani.options(interval=.1) ## change speed
##D ani.replay()
##D 
##D ### animations can also be saved as HTML, animated gifs, etc.
##D saveHTML(ani.replay())
##D 
##D ### animate the clustering process with evaluation
##D ### Note: we choose to exclude noise points from the evaluation
##D ###       measure calculation, even if the algorithm would assign
##D ###       them to a cluster.
##D reset_stream(stream)
##D dbstream <- DSC_DBSTREAM(r=.04, lambda=.1, gaptime=100, Cm=3,
##D   shared_density=TRUE, alpha=.2)
##D 
##D animate_cluster(dbstream, stream, horizon=100, n=5000,
##D   measure="crand", type="macro", assign="micro", noise = "exclude",
##D   plot.args = list(xlim=c(0,1), ylim=c(0,1), shared = TRUE))
## End(Not run)



