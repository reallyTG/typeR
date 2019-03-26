library(fda.usc)


### Name: Depth for multivariate fdata
### Title: Provides the depth measure for a list of p-functional data
###   objects
### Aliases: Depth.pfdata depth.FMp depth.modep depth.RPp
### Keywords: descriptive

### ** Examples

## Not run: 
##D data(tecator)
##D xx<-tecator$absorp
##D xx1<-fdata.deriv(xx,1)
##D lx<-list(xx=xx,xx=xx1)
##D # Fraiman-Muniz Depth
##D par.df<-list(scale =TRUE)
##D out.FM1p=depth.FMp(lx,trim=0.1,draw=TRUE, par.dfunc = par.df)
##D out.FM2p=depth.FMp(lx,trim=0.1,dfunc="mdepth.LD",
##D par.dfunc = par.df, draw=TRUE)
##D 
##D # Random Project Depth
##D out.RP1p=depth.RPp(lx,trim=0.1,dfunc="mdepth.TD",
##D draw=TRUE,par.dfunc = par.df)
##D out.RP2p=depth.RPp(lx,trim=0.1,dfunc="mdepth.LD",
##D draw=TRUE,par.dfunc = par.df)
##D 
##D #Modal Depth
##D out.mode1p=depth.modep(lx,trim=0.1,draw=T,scale=T)
##D out.mode2p=depth.modep(lx,trim=0.1,method="manhattan",
##D draw=T,scale=T)
##D 
##D par(mfrow=c(2,3))
##D plot(out.FM1p$dep,out.FM2p$dep)
##D plot(out.RP1p$dep,out.RP2p$dep)
##D plot(out.mode1p$dep,out.mode2p$dep)
##D plot(out.FM1p$dep,out.RP1p$dep)
##D plot(out.RP1p$dep,out.mode1p$dep)
##D plot(out.FM1p$dep,out.mode1p$dep)
## End(Not run)



