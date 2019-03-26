library(dmm)


### Name: summary.dmm
### Title: Make summary tables of (co)variance component estimates and
###   fixed effect estimates for a dmm object.
### Aliases: summary.dmm
### Keywords: methods

### ** Examples


# get some data
data(sheep.df)
# prepare it - only need "E" and "A" relationship matrices
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# estimate (co)variance components  - individual and maternal
sheep.fit5 <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
              components=c("VarE(I)","VarG(Ia)","VarE(M)","VarG(Ma)",
              "CovG(Ia,Ma)","CovG(Ma,Ia)"))
# look just at component "VarG(Ma)" across all traits
summary(sheep.fit5,componentset="VarG(Ma)",bytrait=FALSE)
# look just at trait "Cww"
summary(sheep.fit5,traitset="Cww")
# cleanup
rm(sheep.df)
rm(sheep.mdf)
rm(sheep.fit5)




