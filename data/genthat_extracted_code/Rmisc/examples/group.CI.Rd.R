library(Rmisc)


### Name: group.CI
### Title: Group Confidence Interval
### Aliases: group.CI
### Keywords: multivariate

### ** Examples

require(latticeExtra)
with(group.CI(weight~feed,chickwts),
 segplot(feed~weight.lower+weight.upper,center=weight.mean)
)

require(Hmisc)
with(group.CI(Temp~Month,airquality),
 xYplot(Cbind(Temp.mean,Temp.lower,Temp.upper)~numericScale(Month),type="b",ylim=c(60,90))
)



