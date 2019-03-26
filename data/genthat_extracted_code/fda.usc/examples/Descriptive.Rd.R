library(fda.usc)


### Name: Descriptive
### Title: Descriptive measures for functional data.
### Aliases: func.mean.formula Descriptive func.mean func.trim.FM
###   func.trim.mode func.trim.RP func.trim.RT func.trim.RPD func.med.FM
###   func.med.mode func.med.RP func.med.RT func.med.RPD func.var
###   func.trimvar.FM func.trimvar.mode func.trimvar.RP func.trimvar.RT
###   func.trimvar.RPD
### Keywords: descriptive

### ** Examples


# Example with Montreal Daily Temperature (fda-package)
fdataobj<-fdata(MontrealTemp)

# Measures of central tendency by group
fac<-factor(c(rep(1,len=17),rep(2,len=17)))
ldata=list("df"=data.frame(fac),"fdataobj"=fdataobj)
a1<-func.mean.formula(fdataobj~fac,data=ldata)
plot(a1)

## Not run: 
##D # Measures of central tendency
##D a1<-func.mean(fdataobj)
##D a2<-func.trim.FM(fdataobj)
##D a3<-func.trim.mode(fdataobj)
##D a4<-func.trim.RP(fdataobj)
##D # a5<-func.trim.RPD(fdataobj,deriv=c(0,1)) # Time-consuming
##D a6<-func.med.FM(fdataobj)
##D a7<-func.med.mode(fdataobj)
##D a8<-func.med.RP(fdataobj)
##D # a9<-func.med.RPD(fdataobj,deriv=c(0,1)) # Time-consuming
##D # a10<-func.med.RT(fdataobj)
##D 
##D dev.new()
##D par(mfrow=c(1,2))
##D plot(c(a1,a2,a3,a4),ylim=c(-26,29),main="Central tendency: trimmed mean")
##D plot(c(a1,a6,a7,a8),ylim=c(-26,29),main="Central tendency: median")
##D 
##D 
##D ## Measures of dispersion
##D b1<-func.var(fdataobj)
##D b2<-func.trimvar.FM(fdataobj)
##D b3<-func.trimvar.FM(fdataobj,trim=0.1)
##D b4<-func.trimvar.mode(fdataobj)
##D b5<-func.trimvar.mode(fdataobj,p=1)
##D b6<-func.trimvar.RP(fdataobj)
##D b7<-func.trimvar.RPD(fdataobj)
##D b8<-func.trimvar.RPD(fdataobj)
##D b9<-func.trimvar.RPD(fdataobj,deriv=c(0,1))
##D dev.new()
##D par(mfrow=c(1,2))
##D plot(c(b1,b2,b3,b4,b5),ylim=c(0,79),main="Measures of dispersion I")
##D plot(c(b1,b6,b7,b8,b9),ylim=c(0,79),main="Measures of dispersion II")
## End(Not run)



