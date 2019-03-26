library(vegclust)


### Name: plot.CAS
### Title: Draws a cummulative abundance surface
### Aliases: plot.CAS

### ** Examples

## Create synthetic tree data
pl = rep(1,100) # All trees in the same plot
sp = ifelse(runif(100)>0.5,1,2) # Random species identity (species 1 or 2)
h=rgamma(100,10,2) # Heights (m)
d = rpois(100, lambda=h^2) # Diameters (cm)
m = data.frame(plot=pl,species=sp, height=h,diameter=d) 
m$ba = pi*(m$diameter/200)^2
print(head(m))

## Size classes
heights = seq(0,4, by=.25)^2 # Quadratic classes
diams = seq(0,130, by=5) # Linear classes

## Stratify tree data
X<-stratifyvegdata(m, sizes1=heights, sizes2=diams, 
                   plotColumn = "plot", speciesColumn = "species", 
                   size1Column = "height", size2Column = "diameter", 
                   abundanceColumn = "ba")


## Build cummulative abundance surface
Y = CAS(X)

## Plot the surface of species '1' in plot '1' using heights and diameters
plot(Y, species=1, sizes1=heights[-1], xlab="height (m)", 
     ylab="diameter (cm)", sizes2=diams[-1], zlab="Basal area (m2)",
     zlim = c(0,6), main="Species 1")



