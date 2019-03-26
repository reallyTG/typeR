library(npsm)


### Name: onecova
### Title: Robust Analysis of Covariance under Heterogeneous Slopes
### Aliases: onecova

### ** Examples

data=latour[,c('quality','rain')]
xcov<-cbind(latour['end.of.harvest'])
onecova(2,data,xcov,print.table=TRUE)



