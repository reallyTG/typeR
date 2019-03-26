library(dmm)


### Name: print.gresponse.dmm
### Title: Print method for object of class 'gresponse.dmm'.
### Aliases: print.gresponse.dmm
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
# print these
print(sheep.resp)
## Not run: 
##D # can do the same thing without saving response object
##D gresponse(sheep.fit1,psd=list(dp=c(1,1,1)))
##D # so this is the default print method for an object of class 'gresponse.dmm'
## End(Not run)
#cleanup
rm(sheep.fit1)
rm(sheep.resp)
rm(sheep.mdf)
rm(sheep.df)



