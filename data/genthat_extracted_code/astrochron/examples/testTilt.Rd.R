library(astrochron)


### Name: testTilt
### Title: Astrochronologic testing via the obliquity amplitude modulation
###   approach of Zeeden et al. (2019 submitted).
### Aliases: testTilt

### ** Examples

## No test: 
### as a test series, use the obliquity series from Laskar et al. (2004), spanning 
### the past 4 million years
ex<-etp(tmin=0,tmax=4000,dt=2,eWt=0,oWt=1,pWt=0,solution=solution,standardize=FALSE)

### now conduct astrochronologic testing
res1=testTilt(ex)

### if you plan to run testTilt repeatedly, it is advisable to download the astronomical
### solution
solution<-getLaskar()

### now conduct astrochronologic testing
res<-testTilt(ex,solution=solution)
## End(No test)



