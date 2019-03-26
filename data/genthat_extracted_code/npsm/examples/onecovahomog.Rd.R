library(npsm)


### Name: onecovahomog
### Title: Robust Analysis of Covariance under Heterogeneous Slopes
### Aliases: onecovahomog

### ** Examples

data=latour[,c('quality','rain')]
xcov<-cbind(latour['end.of.harvest'])
onecovahomog(2,data,xcov,print.table=TRUE)




