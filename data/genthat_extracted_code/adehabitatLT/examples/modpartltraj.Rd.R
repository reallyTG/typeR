library(adehabitatLT)


### Name: modpartltraj
### Title: Segmentation of a trajectory based on Markov models
### Aliases: modpartltraj print.modpartltraj partmod.ltraj print.partltraj
###   bestpartmod plot.partltraj
### Keywords: spatial

### ** Examples


## Not run: 
##D ## Example on the porpoise
##D data(porpoise)
##D 
##D ## Keep the first porpoise
##D gus <- porpoise[1]
##D plot(gus)
##D 
##D ## First test the independence of the step length
##D indmove(gus)
##D ## There is a lack of independence between successive distances
##D 
##D ## plots the distance according to the date
##D plotltr(gus, "dist")
##D 
##D ## One supposes that the distance has been generated
##D ## by normal distribution, with different means for the
##D ## different behaviours
##D ## The means of the normal distribution range from 0 to
##D ## 130000. We suppose a standard deviation equal to 5000:
##D 
##D tested.means <- round(seq(0, 130000, length = 10), 0)
##D (limod <- as.list(paste("dnorm(dist, mean =",
##D                   tested.means,
##D                   ", sd = 5000)")))
##D 
##D ## Build the probability matrix
##D mod <- modpartltraj(gus, limod)
##D 
##D ## computes the corrected log-likelihood for each
##D ## number of segments
##D bestpartmod(mod)
##D 
##D ## The best number of segments is 4. Compute the partition:
##D (pm <- partmod.ltraj(gus, 4, mod))
##D plot(pm)
##D 
##D 
##D ## Shows the partition on the distances:
##D plotltr(gus, "dist")
##D 
##D lapply(1:length(pm$ltraj), function(i) {
##D    lines(pm$ltraj[[i]]$date, rep(tested.means[pm$stats$mod[i]],
##D          nrow(pm$ltraj[[i]])),
##D          col=c("red","green","blue")[as.numeric(factor(pm$stats$mod))[i]],
##D          lwd=2)
##D })
##D 
##D 
##D ## Computes the residuals of the partition
##D res <- unlist(lapply(1:length(pm$ltraj), function(i) {
##D    pm$ltraj[[i]]$dist - rep(tested.means[pm$stats$mod[i]],
##D          nrow(pm$ltraj[[i]]))
##D }))
##D 
##D plot(res, ty = "l")
##D 
##D ## Test of independence of the residuals of the partition:
##D wawotest(res)
##D 
## End(Not run)



