library(FeedbackTS)


### Name: FeedbackTS-package
### Title: Analysis of Feedback in Time Series
### Aliases: FeedbackTS-package FeedbackTS
### Keywords: package

### ** Examples

#### load library
## Not run: library(FeedbackTS)

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### load data of feedback and change-in-feedback indices in 88 sites across Australia
data(rain.feedback.stats)

#### spatial coordinates of the 88 sites
coord=rain.feedback.stats[,3:4]


########  ANALYSIS OF FEEDBACK WITH A SINGLE TIME SERIES

#### build KDD objects from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008,keyday.threshold=25,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,filter=NULL)

#### test feedback and change in feedback with a single data series
## using the thresholded data series
## using difference of means of positive indicator values (i.e. rainfall occurrence)
## computer intensive stage
## Not run: 
##D par(mfrow=c(1,2), mar=c(5.1,4.1,4.1,2.1))
##D feedback.test(object=KDD, test="feedback", operator="dmpiv", nb.rand=10^3, plots=TRUE)
## End(Not run)

########  ANALYSIS OF FEEDBACK WITH A SET OF TIME SERIES COLLECTED ACROSS SPACE

#### map of feedback index computed from the whole data series
par(mfrow=c(1,1), mar=c(0,0,0,0))
stat1=rain.feedback.stats[["Feedback.whole.period"]]
map.statistic(coord,stat1,cex.circles=c(3,0.2),
   region=list(border='Australia',xlim=c(110,155)),
   legend=list(x=c(rep(114,3),rep(123,2)),y=-c(37,39.5,42,37,39.5),
      xtext=c(rep(114,3),rep(123,2))+1,ytext=-c(37,39.5,42,37,39.5),digits=2),
  main="Feedback")

#### variogram analysis and kriging of feedback index
## computer intensive stage
## Not run: 
##D par(mfrow=c(2,3), mar=c(5.1,4.1,4.1,2.1))
##D kr1=krige(coordinates=coord,statistic=stat1,
##D    grid=list(x=seq(110,155,0.25),y=seq(-45,-11,0.25),border="Australia",
##D       proj="+proj=lcc +lat_1=-18 +lat_2=-36 +lat0=-25 +lon_0=140",degrees=TRUE),
##D    variog.param=list(keep.distance=2/3,nb.bin=15,cov.pars=c(0.0008,10^6),
##D       nugget=0.0001,fix.nugget=FALSE,coordinates.scaling=10^5,statistic.scaling=0.01),
##D    krige.param=list(type.krige="ok",trend.d="1st"),plots=TRUE)
## End(Not run)

#### test spatial variation in feedback index and plot test output
## computer intensive stage
## Not run: 
##D kt1=krige.test(krige.output=kr1,subregion=list(x=c(138,152,152,138),y=-c(40,40,33,33)),
##D   alternative="greater", nb.rand=2000)
##D par(mfrow=c(1,2), mar=c(5.1,4.1,4.1,2.1))	
##D plot(kt1,digits=list(predict=3,pvalue=3),breaks=12)
## End(Not run)



