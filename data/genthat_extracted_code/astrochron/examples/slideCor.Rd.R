library(astrochron)


### Name: slideCor
### Title: Identify optimal spatial/temporal shift to maximize correlation
###   between two stratigraphic series.
### Aliases: slideCor

### ** Examples

# Example 1: generate AR1 noise
ex1 <- ar1(npts=1000,dt=1)
# isolate a section
ex2 <- iso(ex1,xmin=200,500)
ex2[1] <- ex2[1]-200

slideCor(ex1,ex2)

# Example 2: an astronomical signal
ex1=etp(tmin=0,tmax=1000)
# isolate a section
ex2=iso(ex1,xmin=400,xmax=600)
ex2[1] <- ex2[1]-400

slideCor(ex1,ex2)



