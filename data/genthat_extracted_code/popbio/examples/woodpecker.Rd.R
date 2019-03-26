library(popbio)


### Name: woodpecker
### Title: Survirvorship data for adult and juvenile Acorn Woodpeckers
### Aliases: woodpecker
### Keywords: datasets

### ** Examples

data(woodpecker)
woodpecker
with(subset(woodpecker, rate=='adult'), 
 plot(year, start, type='o', pch=16, 
 ylab="Number of adults", xlab="Year",
 main="Acorn Woodpeckers in Water Canyon"))
##stage-specific survival rate
x<-aggregate(list(Nstart=woodpecker$start, Nsurv=woodpecker$surv),
list(stage=woodpecker$rate), sum)
x$survival<-x[,3]/x[,2]
x



