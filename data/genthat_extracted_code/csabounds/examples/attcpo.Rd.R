library(csabounds)


### Name: attcpo
### Title: attcpo
### Aliases: attcpo

### ** Examples

data(displacements)
cc <- qte::CiC(learn ~ treat,
               t=2011, tmin1=2007, tname="year",
               idname="id", panel=TRUE, data=displacements,
               probs=seq(.05,.95,.01),se=FALSE)
cc$F.treated.tmin1 <- ecdf(subset(displacements, year==2007 & treat==1)$learn)
cc$F.treated.tmin2 <- ecdf(subset(displacements, year==2003 & treat==1)$learn)
ac <- attcpo(learn ~ treat, 2011, 2007, 2003, "year", displacements,
        "id", cc, method="rank", yseqlen=10)
ac
ggattcpo(ac)




