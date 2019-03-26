library(FeedbackTS)


### Name: krige
### Title: Kriging function
### Aliases: krige
### Keywords: misc

### ** Examples

#### load data of feedback and change-in-feedback indices in 88 sites across Australia
data(rain.feedback.stats)

#### spatial coordinates of the 88 sites
coord=rain.feedback.stats[,3:4]

#### feedback index
stat1=rain.feedback.stats[["Feedback.whole.period"]]

#### variogram analysis and kriging of feedback index
## computer intensive stage
## Not run: 
##D par(mfrow=c(2,3), mar=c(5.1,4.1,4.1,4.1))
##D kr1=krige(coordinates=coord, statistic=stat1,
##D    grid=list(x=seq(110,155,0.25),y=seq(-45,-11,0.25),border="Australia", 
##D       proj="+proj=lcc +lat_1=-18 +lat_2=-36 +lat0=-25 +lon_0=140",degrees=TRUE),
##D    variog.param=list(keep.distance=2/3,nb.bin=15,cov.pars=c(0.0008,10^6),
##D       nugget=0.0001,fix.nugget=FALSE,coordinates.scaling=10^5,statistic.scaling=0.01),
##D    krige.param=list(type.krige="ok",trend.d="1st"),plots=TRUE) 
## End(Not run)



