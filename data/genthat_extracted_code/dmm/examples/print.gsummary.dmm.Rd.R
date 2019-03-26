library(dmm)


### Name: print.gsummary.dmm
### Title: Print method for object of class 'gsummary.dmm'.
### Aliases: print.gsummary.dmm
### Keywords: methods

### ** Examples


library(dmm)
data(sheep.df)
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# make a simple fit object - OLS-b only
sheep.fit1 <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
   components=c("VarE(I)","VarG(Ia)"))
# compute a 'gsummary.dmm' object, use all the defaults
sheep.gsum <- gsummary(sheep.fit1)
# print the summary of genetic parameters
print(sheep.gsum)
## Not run: 
##D # can do the same thing without saving response object
##D gsummary(sheep.fit1)
##D # so this is the default print method for an object of class 'gsummary.dmm'
## End(Not run)
#cleanup
rm(sheep.fit1)
rm(sheep.gsum)
rm(sheep.mdf)
rm(sheep.df)



