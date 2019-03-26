library(plink)


### Name: plot.irt.prob
### Title: Plot Item Stuff
### Aliases: plot.irt.prob plot.sep.pars plot.irt.pars plot.list
### Keywords: misc

### ** Examples

###### Unidimensional Examples ######
# Compute probabilites for three dichotomous (3PL) items and two polytomous
# (gpcm) items then plot the item characteristic/category curves
dichot <- matrix(c(1.2, .8, .9, 2.3, -1.1, -.2, .24, .19, .13),3,3)
poly <- matrix(c(.64, -1.8, -.73, .45, NA, .88, .06, 1.4, 1.9, 2.6),
  2,5,byrow=TRUE)
pars <- rbind(cbind(dichot,matrix(NA,3,2)),poly)
cat <- c(2,2,2,4,5)
pm <- as.poly.mod(5, c("drm","gpcm"), list(1:3,4:5))
x <- mixed(pars, cat, pm) 
plot(x)

# Compute probabilites for six items using the 3PL and plot all of the item
# characteristic curves on a single panel using the combine argument
a <- c(.71,.96,.36,1.05,1.76,.64)
b <- c(-.16,1.18,2.03,1.09,.82,-1.56)
c <- c(.22,.17,.24,.08,.20,.13)
theta <- seq(-3,3,.2)
pars <- cbind(a,b,c)
x <- drm(pars,theta)
plot(x,combine=6,item.names="Items 1-6",auto.key=list(space="right"))

# Compute probabilties for the nominal response model using the ACT
# mathematics data. Plot the item category curves for a subset of 9 items.
x <- nrm(act.nrm[[1]], rep(5,60))
plot(x, items=c(2,7,12,20,35,41,48,57,60),auto.key=list(space="right"))

# Create irt.pars object with two groups (all dichotomous items)
# rescale the item parameters using the Stocking-Lord linking constants
# Create drift plots 
pm <- as.poly.mod(36)
x <- as.irt.pars(KB04$pars, KB04$common, cat=list(rep(2,36),rep(2,36)), 
  poly.mod=list(pm,pm))
out <- plink(x, rescale="SL", base.grp=2, D=1.7)
plot(out$pars, drift="all", grp.names=c("Form X","Form Y"), 
item.nums=TRUE)

## Not run: 
##D # Compute linking constants for six groups using mixed-format items 
##D # Create drift plots with distinct markers for the two response models
##D pm1 <- as.poly.mod(41, c("drm", "gpcm"), reading$items[[1]])
##D pm2 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[2]])
##D pm3 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[3]])
##D pm4 <- as.poly.mod(70, c("drm", "gpcm"), reading$items[[4]])
##D pm5 <- as.poly.mod(72, c("drm", "gpcm"), reading$items[[5]])
##D pm6 <- as.poly.mod(71, c("drm", "gpcm"), reading$items[[6]])
##D pm <- list(pm1, pm2, pm3, pm4, pm5, pm6)
##D x <- as.irt.pars(reading$pars, reading$common, reading$cat, pm, base.grp=4)
##D out <- plink(x, rescale="HB")
##D plot(out$pars, drift=c("a","b"), sep.mod=TRUE)
## End(Not run)

###### Multidimensional Examples ######
# Compute response probabilities for 20 items from the 
# reckase9 data. Probabilites are modeled using the M2PL. 
# Each of the six plot types will be created.
x <- drm(reckase9[[1]][[1]][31:50,],dimensions=2)

# Wireframe plot
plot(x, drape=TRUE, item.names=paste("Item",31:50))
# Contour Plot
plot(x, type="contourplot",labels=FALSE,cuts=20)
# Level Plot
plot(x, type="levelplot",cuts=20)

# Use all the items for the vector plots
x <- drm(reckase9[[1]][[1]],dimensions=2)
# Vector Plot 1
plot(x, type="vectorplot1",item.nums=FALSE)
# Vector Plot 2
plot(x, type="vectorplot2",item.nums=FALSE)
# Vector Plot 3
plot(x, type="vectorplot3",xlim=c(-1.5,1.5),ylim=c(-1.5,1.5))


# Compute response probabilities for a single three-category item using 
# the multidimensional generalized partial credit model for three 
# dimensions. Plot the conditional item category surfaces in a single 
# panel and then the separated item category surfaces in separate panels
pars <- matrix(c(1.1999,0.5997,0.8087,2.1730,-1.4576),1,5)
x <- gpcm(pars,3,dimensions=3,theta=-4:4)

# plot combined item category surfaces. Rotate the plots using the
# screen argument
plot(x, screen=list(z=-30,x=-60))

## Not run: 
##D # plot separated item category surfaces
##D x <- gpcm(pars,3,dimensions=3)
##D plot(x,separate=TRUE,drape=TRUE,panels=1)
## End(Not run)



