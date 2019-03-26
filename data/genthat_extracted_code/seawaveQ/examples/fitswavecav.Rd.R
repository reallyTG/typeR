library(seawaveQ)


### Name: fitswavecav
### Title: Fit seasonal wave and continuous ancillary data for trend
###   analysis
### Aliases: fitswavecav
### Keywords: models regression survival ts

### ** Examples

data(swData)
modMoRivOmaha<-combineData(qwdat=qwMoRivOmaha, cqwdat=cqwMoRivOmaha)
myfit1 <- fitswavecav(cdat=modMoRivOmaha, cavdat=cqwMoRivOmaha,
tanm="myfit1", pnames=c("04035", "04037", "04041"), yrstart=1995,
yrend=2003, tndbeg=1995, tndend=2003, iwcav=c("flowa30","flowa1"),
dcol="dates", qwcols=c("R","P"))
 ## Not run: 
##D myfit2 <- fitswavecav(cdat=modMoRivOmaha, cavdat=cqwMoRivOmaha,
##D tanm="myfit2", pnames=c("04035", "04037", "04041"), yrstart=1995,
##D yrend=2003, tndbeg=1995, tndend=2003, iwcav=c("seda30","seda1"),
##D dcol="dates", qwcols=c("R","P"))
##D myfit3 <- fitswavecav(cdat=modMoRivOmaha, cavdat=cqwMoRivOmaha,
##D tanm="myfit3", pnames=c("04035", "04037", "04041"), yrstart=1995,
##D yrend=2003, tndbeg=1995, tndend=2003, iwcav=c("flowa30","flowa1",
##D "seda30", "seda1"), dcol="dates", qwcols=c("R","P"))
## End(Not run)
# trend model results
myfit1[[1]]
# example regression call
myfit1[[2]][[1]]
# first few lines of observed concentrations
head(myfit1[[3]])
# first few lines of predicted concentrations
head(myfit1[[4]])
# summary statistics for predicted concentrations
head(myfit1[[5]])



