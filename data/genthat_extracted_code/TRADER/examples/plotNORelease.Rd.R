library(TRADER)


### Name: plotNORelease
### Title: Plot number of releases.
### Aliases: plotNORelease
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)

abs<-absIncrease(relData1)
abs.threshold<- absTreshold(abs)
fw <- absoluteIncrease(relData1,abs,abs.threshold)

release_list <- reduceByLB(releases=fw$releases,above=fw$all_releases,type=1)
rs<-writeReleaseStats(release_list,"Total number of releases is")
plotNORelease(relData1,rs, criteria=round(abs.threshold,3),prefix="relai")



