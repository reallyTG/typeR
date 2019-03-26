library(GWmodel)


### Name: ggwr.basic
### Title: Generalised GWR models with Poisson and Binomial options
### Aliases: ggwr.basic gwr.generalised gwr.binomial gwr.binomial.wt
###   gwr.poisson gwr.poisson.wt gwr.fitted print.ggwrm
### Keywords: generalised, GWR

### ** Examples

data(LondonHP)
## Not run: 
##D DM<-gw.dist(dp.locat=coordinates(londonhp))
##D bw.f1 <- bw.ggwr(BATH2~FLOORSZ,data=londonhp, dMat=DM)
##D res.poisson<-ggwr.basic(BATH2~FLOORSZ, bw=bw.f1,data=londonhp, dMat=DM)
##D bw.f2 <- bw.ggwr(BATH2~FLOORSZ,data=londonhp, dMat=DM,family ="binomial")
##D res.binomial<-ggwr.basic(BATH2~FLOORSZ, bw=bw.f2,data=londonhp, dMat=DM,
##D               family ="binomial")
## End(Not run)



