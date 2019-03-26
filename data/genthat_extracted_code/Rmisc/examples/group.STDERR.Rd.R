library(Rmisc)


### Name: group.STDERR
### Title: Group Standard Error Interval
### Aliases: group.STDERR
### Keywords: multivariate

### ** Examples

require(latticeExtra)
with(group.STDERR(weight~feed,chickwts),
 segplot(feed~weight.lower+weight.upper,center=weight.mean)
)

require(Hmisc)
with(group.STDERR(Temp~Month,airquality),
 xYplot(Cbind(Temp.mean,Temp.lower,Temp.upper)~numericScale(Month),type="b",ylim=c(60,90))
)



