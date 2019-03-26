library(FeedbackTS)


### Name: after.minus.before
### Title: Computation of after-before differences around key days
### Aliases: after.minus.before
### Keywords: misc

### ** Examples

#### load data for site 6008 (Callagiddy station)
data(rain.site.6008)

#### build KDD objects from raw data (site 6008: Callagiddy station)
## using a threshold value equal to 25
KDD=kdd.from.raw.data(raw.data=rain.site.6008,keyday.threshold=25,nb.days=20,
   col.series=5,col.date=c(2,3,4),na.rm=TRUE,filter=NULL)

#### compute and plot after-before differences of KDD 
par(mfrow=c(2,2), mar=c(5.1,4.1,4.1,4.1))

## using option dmpiv (difference of means of positive indicator values)
amb1=after.minus.before(KDD,"dmpiv")
plot(KDD["day"],amb1,type="l",xlab="Day",ylab="After-Before")
abline(h=0,lty="dashed",col="grey")
plot(KDD["day"],cumsum(amb1),type="l",xlab="Day",ylab="Cumul After-Before")
abline(h=0,lty="dashed",col="grey")

## using option dmv (difference of means of values)
amb2=after.minus.before(KDD,"dmv")
plot(KDD["day"],amb2,type="l",xlab="Day",ylab="After-Before")
abline(h=0,lty="dashed",col="grey")
plot(KDD["day"],cumsum(amb2),type="l",xlab="Day",ylab="Cumul After-Before")
abline(h=0,lty="dashed",col="grey")



