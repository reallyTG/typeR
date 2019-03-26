library(csabounds)


### Name: F.Y0
### Title: F.Y0
### Aliases: F.Y0

### ** Examples

data(displacements)
ytmin1 <- 10
Y1t <- subset(displacements, year==2011 & treat==1)$learn
Y0tmin1 <- subset(displacements, year==2007 & treat==1)$learn
Y0tmin2 <- subset(displacements, year==2003 & treat==1)$learn
y.seq <- seq(min(c(Y0tmin2,Y0tmin1,Y1t)), max(c(Y0tmin2,Y0tmin1,Y1t)), length.out=100)
cc <- qte::CiC(learn ~ treat,
               t=2011, tmin1=2007, tname="year",
               idname="id", panel=TRUE, data=displacements,
               probs=seq(.05,.95,.01),se=FALSE)
cc$F.treated.tmin2 <- ecdf(subset(displacements, year==2003 & treat==1)$learn)
cc$F.treated.tmin1 <- ecdf(subset(displacements, year==2007 & treat==1)$learn)
F.Y0(ytmin1, y.seq, Y0tmin1, Y0tmin2, cc)




