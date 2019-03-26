library(crseEventStudy)


### Name: demo_share_repurchases
### Title: Abnormal standardized returns for german stock repurchase
###   announcements
### Aliases: demo_share_repurchases

### ** Examples

## load demo_share_repurchases
data(demo_share_repurchases)

## calculate the mean abnormal return for the subsequent three years after
## the announcement of share repurchases for Munich Re AG from Apr. 2015 to Mar. 2018
beginn <- which(demo_share_repurchases$code=="D:MUV2" && demo_share_repurchases$date=="201504")
stop <- beginn + 35
mean(demo_share_repurchases$ars[beginn:stop])



