library(npsm)


### Name: onecovaheter
### Title: Robust Analysis of Covariance under Heterogeneous Slopes
### Aliases: onecovaheter

### ** Examples

data=latour[,c('quality','rain')]
xcov<-cbind(latour['end.of.harvest'])
onecovaheter(2,data,xcov,print.table=TRUE)



