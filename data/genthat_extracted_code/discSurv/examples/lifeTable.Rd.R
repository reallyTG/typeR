library(discSurv)


### Name: lifeTable
### Title: Life Table Construction and Estimates
### Aliases: lifeTable
### Keywords: survival

### ** Examples

# Example with unemployment data
library(Ecdat)
data(UnempDur)

# Extract subset of all persons smaller or equal the median of age
UnempDurSubset <- subset(UnempDur, age<=median(UnempDur$age))
LifeTabUnempDur <- lifeTable (dataSet=UnempDurSubset, timeColumn="spell", censColumn="censor1")
LifeTabUnempDur

# Example with monoclonal gammapothy data
library(survival)
head(mgus)
# Extract subset of mgus
subMgus <- mgus [mgus$futime<=median(mgus$futime), ]
# Transform time in days to intervals [0, 1), [1, 2), [2, 3), ... , [12460, 12461)
mgusInt <- subMgus
mgusInt$futime <- mgusInt$futime + 1
LifeTabGamma <- lifeTable (dataSet=mgusInt, timeColumn="futime", censColumn="death")
head(LifeTabGamma$Output, 25)
plot(x=1:dim(LifeTabGamma$Output)[1], y=LifeTabGamma$Output$hazard, type="l", 
xlab="Time interval", ylab="Hazard", las=1, 
main="Life table estimated marginal hazard rates")



