library(fda.usc)


### Name: Depth for univariate fdata
### Title: Provides the depth measure for functional data
### Aliases: Depth depth.FM depth.mode depth.RP depth.RPD depth.RT
###   depth.FSD depth.KFSD
### Keywords: descriptive

### ** Examples

## Not run: 
##D #Ex: CanadianWeather data
##D tt=1:365
##D fdataobj<-fdata(t(CanadianWeather$dailyAv[,,1]),tt)
##D # Fraiman-Muniz Depth
##D out.FM=depth.FM(fdataobj,trim=0.1,draw=TRUE)
##D #Modal Depth
##D out.mode=depth.mode(fdataobj,trim=0.1,draw=TRUE)
##D out.RP=depth.RP(fdataobj,trim=0.1,draw=TRUE)
##D out.RT=depth.RT(fdataobj,trim=0.1,draw=TRUE)
##D out.FSD=depth.FSD(fdataobj,trim=0.1,draw=TRUE)
##D out.KFSD=depth.KFSD(fdataobj,trim=0.1,draw=TRUE)
##D ## Double Random Projections
##D out.RPD=depth.RPD(fdataobj,deriv=c(0,1),dfunc2=depth.FM,
##D trim=0.1,draw=TRUE)
##D out<-c(out.FM$mtrim,out.mode$mtrim,out.RP$mtrim,out.RPD$mtrim)
##D plot(fdataobj,col="grey")
##D lines(out)
##D cdep<-cbind(out.FM$dep,out.mode$dep,out.RP$dep,out.RT$dep,out.FSD$dep,out.KFSD$dep)
##D colnames(cdep)<-c("FM","mode","RP","RT","FSD","KFSD")
##D pairs(cdep)
##D round(cor(cdep),2)
## End(Not run)



