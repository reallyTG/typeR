library(epade)


### Name: box.plot.ade
### Title: Boxplot
### Aliases: box.plot.ade
### Keywords: boxplot violinlot box-percentile

### ** Examples

x<-rnorm(1000)
g<-round(runif(1000))
g2<-round(runif(1000))
box.plot.ade(x, g, g2, vnames=list(c("subgroup 1","subgroup 2"),
c("group 1", "group 2")), wall=0, count='N: ?', means=TRUE)
box.plot.ade(x, g, g2, vnames=list(c("subgroup 1","subgroup 2"),
c("group 1", "group 2")), wall=1, type="violin")
box.plot.ade(x, g, g2, vnames=list(c("subgroup 1","subgroup 2"),
c("group 1", "group 2")), wall=2, type="percentile")
box.plot.ade(x, g, g2, vnames=list(c("subgroup 1","subgroup 2"),
c("group 1", "group 2")), wall=3, type="sd")



