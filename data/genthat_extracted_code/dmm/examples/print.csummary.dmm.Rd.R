library(dmm)


### Name: print.csummary.dmm
### Title: Print method for object of class 'csummary.dmm'.
### Aliases: print.csummary.dmm
### Keywords: methods

### ** Examples


library(dmm)
data(sheep.df)
sheep.mdf <- mdf(sheep.df,pedcols=c(1:3),factorcols=c(4:6),ycols=c(7:9),
             sexcode=c("M","F"),relmat=c("E","A"))
# make a simple fit object - OLS-b only
sheep.fits <- dmm(sheep.mdf, Ymat ~ 1 + Year + Sex,
          components="VarE(I)",specific.components=list(Sex="VarG(Ia)"))
# compute a 'csummary.dmm' object, use all the defaults
sheep.csum <- csummary(sheep.fits)
# print the summary of genetic parameters
print(sheep.csum)
## Not run: 
##D # can do the same thing without saving response object
##D csummary(sheep.fits)
##D # so this is the default print method for an object of class 'csummary.dmm'
## End(Not run)
#cleanup
rm(sheep.fits)
rm(sheep.csum)
rm(sheep.mdf)
rm(sheep.df)



