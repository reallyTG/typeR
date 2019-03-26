library(GLDEX)


### Name: fun.plot.many.gld
### Title: Plotting many univariate generalised lambda distributions on one
###   page.
### Aliases: fun.plot.many.gld
### Keywords: hplot

### ** Examples


## Fit the dataset
# junk<-rnorm(1000,3,2)
# result.hs<-fun.data.fit.hs(junk,rs.default = "Y", fmkl.default = "Y", 
# rs.leap=3, fmkl.leap=3,rs.init = c(-1.5, 1.5), fmkl.init = c(-0.25, 1.5),
# no.c.rs=50,no.c.fmkl=50)

# par(mfrow=c(2,2))

## Plot the entire data range
# fun.plot.many.gld(result.hs,junk,"x","density","",
# legd=c("RPRS.hs", "RMFMKL.hs"))

## Plot and compare parts of the distributions
# fun.plot.many.gld(result.hs,c(1,2),"x","density","",legd=c("RPRS.hs", 
#"RMFMKL.hs"))
# fun.plot.many.gld(result.hs,c(0.1,0,2),"x","density","",legd=c("RPRS.hs", 
#"RMFMKL.hs"))
# fun.plot.many.gld(result.hs,c(3,4),"x","density","",legd=c("RPRS.hs", 
#"RMFMKL.hs"))




