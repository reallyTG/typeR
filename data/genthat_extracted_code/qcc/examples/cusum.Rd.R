library(qcc)


### Name: cusum
### Title: Cusum chart
### Aliases: cusum cusum.qcc print.cusum.qcc summary.cusum.qcc
###   plot.cusum.qcc
### Keywords: htest hplot

### ** Examples

##
## Grouped-data
##
data(pistonrings)
attach(pistonrings)
diameter <- qcc.groups(diameter, sample)

q <- cusum(diameter[1:25,], decision.interval = 4, se.shift = 1)
summary(q)

q <- cusum(diameter[1:25,], newdata=diameter[26:40,])
summary(q)
plot(q, chart.all=FALSE)

detach(pistonrings)



