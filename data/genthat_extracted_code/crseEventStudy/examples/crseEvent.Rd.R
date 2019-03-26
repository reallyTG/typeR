library(crseEventStudy)


### Name: crseEvent
### Title: Clustering robust t-statistics for abnormal returns in
###   long-horizon event studies
### Aliases: crseEvent

### ** Examples

## load demo_share_repurchases
## one-way clustering on column "date" and print summary statistics
data(demo_share_repurchases)
crse <- crseEvent(demo_share_repurchases, abnr="ars", cluster1 = "date")
summary(crse)

## print mean of abnormal return series
crse$mean.abnormal.ret



