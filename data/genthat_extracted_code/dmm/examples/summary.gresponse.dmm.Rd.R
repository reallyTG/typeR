library(dmm)


### Name: summary.gresponse.dmm
### Title: Summary method for object of class 'gresponse.dmm'.
### Aliases: summary.gresponse.dmm
### Keywords: methods

### ** Examples


library(dmm)
data(sheep.df)
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# make a simple fit object - OLS-b only
sheep.fit1 <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
   components=c("VarE(I)","VarG(Ia)"))
# compute some response estimates, use all the defaults
sheep.resp <- gresponse(sheep.fit1,psd=list(dp=c(1,1,1)))
# summarize these
summary(sheep.resp)
#cleanup
rm(sheep.fit1)
rm(sheep.resp)
rm(sheep.mdf)
rm(sheep.df)



