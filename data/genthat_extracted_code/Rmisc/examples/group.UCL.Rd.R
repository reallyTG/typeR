library(Rmisc)


### Name: group.UCL
### Title: Group Upper-Center-Lower
### Aliases: group.UCL
### Keywords: multivariate

### ** Examples

require(latticeExtra)
with(group.UCL(weight~feed,chickwts,FUN=CI),
 segplot(feed~weight.lower+weight.upper,center=weight.mean)
)

require(Hmisc)
with(group.UCL(Temp~Month,airquality,FUN=STDERR),
 xYplot(Cbind(Temp.mean,Temp.lower,Temp.upper)~numericScale(Month),type="b",ylim=c(60,90))
)



