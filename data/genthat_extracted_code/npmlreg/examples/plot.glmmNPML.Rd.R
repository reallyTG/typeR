library(npmlreg)


### Name: plot.glmmNPML
### Title: Plot Diagnostics for objects of class glmmNPML or glmmGQ
### Aliases: plot.glmmNPML plot.glmmGQ
### Keywords: models regression

### ** Examples


data(galaxies, package="MASS")
gal<-as.data.frame(galaxies)
galaxy.np4u <- alldist(galaxies/1000~1,random=~1,k=4,tol=0.5,data=gal,lambda=1)
predict(galaxy.np4u, type="response") # EBP on scale of responses

plot(galaxy.np4u,  plot.opt=4) # plots only EBP vs.  response
plot(galaxy.np4u,  plot.opt=3) # gives same output as given by default when executing alldist
plot(galaxy.np4u)              # gives all four plots.



