library(csabounds)


### Name: E.Y0
### Title: E.Y0
### Aliases: E.Y0

### ** Examples

data(displacements)
ytmin1 <- 10
Y0tmin1 <- subset(displacements, year==2007 & treat==1)$learn
Y0tmin2 <- subset(displacements, year==2003 & treat==1)$learn
cc <- qte::CiC(learn ~ treat,
               t=2011, tmin1=2007, tname="year",
               idname="id", panel=TRUE, data=displacements,
               probs=seq(.05,.95,.01),se=FALSE)
cc$F.treated.tmin2 <- ecdf(subset(displacements, year==2003 & treat==1)$learn)
cc$F.treated.tmin1 <- ecdf(subset(displacements, year==2007 & treat==1)$learn)
E.Y0(ytmin1, Y0tmin1, Y0tmin2, cc)




