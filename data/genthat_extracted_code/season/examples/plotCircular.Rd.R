library(season)


### Name: plotCircular
### Title: Circular Plot Using Segments
### Aliases: plotCircular

### ** Examples
## No test: 
# months (dummy data)
plotCircular(area1=seq(1,12,1), scale=0.7, labels=month.abb, dp=0)
# weeks (random data)
daysoftheweek = c('Monday','Tuesday','Wednesday','Thursday','Friday',
'Saturday','Sunday')
weekfreq = table(round(runif(100, min=1, max=7)))
plotCircular(area1=weekfreq, labels=daysoftheweek, dp=0)
# Observed number of AFL players with expected values
data(AFL)
plotCircular(area1=AFL$players, area2=AFL$expected, scale=0.72,
  labels=month.abb, dp=0, lines=TRUE, legend=FALSE)
plotCircular(area1=AFL$players, area2=AFL$expected, scale=0.72,
  labels=month.abb, dp=0, lines=TRUE, pieces.col=c("green","red"),
  auto.legend=list(labels=c("Obs","Exp"), title="# players"),
  main="Observed and Expected AFL players")
## End(No test)



