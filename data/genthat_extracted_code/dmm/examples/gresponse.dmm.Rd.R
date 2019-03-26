library(dmm)


### Name: gresponse.dmm
### Title: Compute response to selection, given phenotypic selection
###   differentials.
### Aliases: gresponse.dmm gresponse
### Keywords: methods misc

### ** Examples

 
library(dmm)
# get some data
data(sheep.df)
# prepare it - only need "E" and "A" relationship matrices
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# estimate genetic parameters - individual and maternal
sheep.fit5 <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
              components=c("VarE(I)","VarG(Ia)","VarE(M)","VarG(Ma)",
              "CovG(Ia,Ma)","CovG(Ma,Ia)"))
# compute response using overall psd
sheep.resp <- gresponse(sheep.fit5,psd=list(dp=c(1,1,1)),effects=c("G(Ia)","G(Ma)"))
# look at the response object
summary(sheep.resp)
# cleanup
rm(sheep.df)
rm(sheep.mdf)
rm(sheep.fit5)
rm(sheep.resp)




