library(dmm)


### Name: print.dmm
### Title: Print method for a 'dmm()' fitted model object.
### Aliases: print.dmm
### Keywords: methods

### ** Examples


library(dmm)
data(sheep.df)
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A","D"))
# make a simple fit object - OLS-b only
sheep.fit1 <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
    components=c("VarE(I)","VarG(Ia)"))
# look at model plus fixed effects and components for all traits
print(sheep.fit1)
## Not run: 
##D # can do the same thing without saving fit object
##D dmm(sheep.mdf, Ymat ~ 1 + Year + Tb + Sex,
##D     components=c("VarE(I)","VarG(Ia)"))
##D # so this is the default print method for an object of class 'dmm'
## End(Not run)
#cleanup
rm(sheep.fit1)
rm(sheep.mdf)
rm(sheep.df)



