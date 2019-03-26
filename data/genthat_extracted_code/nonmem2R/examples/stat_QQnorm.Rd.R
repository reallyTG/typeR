library(nonmem2R)


### Name: stat_QQnorm
### Title: Quantile-Quantile Plots
### Aliases: stat_QQnorm

### ** Examples

dd<-data.frame(gr=c(rep("A",20),rep("B",40)))
dd$dv<-2*(dd$gr=="B")+rnorm(nrow(dd))/(1+2*(dd$gr=="A"))
dd<-dd[order(dd$gr,dd$dv),]
dd$px<-NA
for(gri in levels(dd$gr)){
  dd$px[dd$gr==gri]<-qqnorm(dd$dv[dd$gr==gri],plot=FALSE)$x
}
ggplot(dd, aes(dv)) +
  stat_QQnorm()+
  facet_wrap(~gr)
## Not run: 
##D ggplot(dd, aes(dv,color=factor(gr))) +
##D   stat_QQnorm()
##D   
## End(Not run)



