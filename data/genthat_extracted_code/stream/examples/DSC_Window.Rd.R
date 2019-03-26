library(stream)


### Name: DSC_Window
### Title: A sliding window from a Data Stream
### Aliases: DSC_Window

### ** Examples

stream <- DSD_Gaussians(k=3, d=2, noise=0.05)

window <- DSC_Window(horizon=100)
window

update(window, stream, 200)
window

# plot micro-clusters
plot(window, stream)

# animation for a window using a damped window model. The weight decays
# with a half-life of 25
## Not run: 
##D window <- DSC_Window(horizon=25, lambda=1/25)
##D animate_cluster(window, stream, horizon=1, n=100, xlim=c(0,1), ylim=c(0,1))
## End(Not run)



