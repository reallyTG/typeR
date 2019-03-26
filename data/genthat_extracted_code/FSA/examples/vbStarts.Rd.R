library(FSA)


### Name: vbStarts
### Title: Find reasonable starting values for a von Bertalanffy growth
###   function.
### Aliases: vbStarts
### Keywords: manip

### ** Examples

## Simple examples of each parameterization
vbStarts(tl~age,data=SpotVA1)
vbStarts(tl~age,data=SpotVA1,type="Original")
vbStarts(tl~age,data=SpotVA1,type="GQ")
vbStarts(tl~age,data=SpotVA1,type="Mooij")
vbStarts(tl~age,data=SpotVA1,type="Weisberg")
vbStarts(tl~age,data=SpotVA1,type="Francis",ages2use=c(0,5))
vbStarts(tl~age,data=SpotVA1,type="Schnute",ages2use=c(0,5))
vbStarts(tl~age,data=SpotVA1,type="Somers")
vbStarts(tl~age,data=SpotVA1,type="Somers2")
vbStarts(tl~age,data=SpotVA1,type="Pauly")
vbStarts(tl~age,data=SpotVA1,type="Ogle",valOgle=c(tr=0))
vbStarts(tl~age,data=SpotVA1,type="Ogle",valOgle=c(Lr=8))

## Using a different method to find Linf
vbStarts(tl~age,data=SpotVA1,methLinf="oldAge")
vbStarts(tl~age,data=SpotVA1,methLinf="oldAge",num4Linf=2)
vbStarts(tl~age,data=SpotVA1,methLinf="longFish")
vbStarts(tl~age,data=SpotVA1,methLinf="longFish",num4Linf=10)
vbStarts(tl~age,data=SpotVA1,type="Original",methLinf="oldAge")
vbStarts(tl~age,data=SpotVA1,type="Original",methLinf="oldAge",num4Linf=2)
vbStarts(tl~age,data=SpotVA1,type="Original",methLinf="longFish")
vbStarts(tl~age,data=SpotVA1,type="Original",methLinf="longFish",num4Linf=10)
vbStarts(tl~age,data=SpotVA1,type="Ogle",valOgle=c(tr=0),methLinf="oldAge",num4Linf=2)
vbStarts(tl~age,data=SpotVA1,type="Ogle",valOgle=c(Lr=8),methLinf="longFish",num4Linf=10)

## Using a different method to find t0 and L0
vbStarts(tl~age,data=SpotVA1,meth0="yngAge")
vbStarts(tl~age,data=SpotVA1,type="original",meth0="yngAge")

## Using a different method to find the L1, L2, and L3
vbStarts(tl~age,data=SpotVA1,type="Francis",ages2use=c(0,5),methEV="means")
vbStarts(tl~age,data=SpotVA1,type="Schnute",ages2use=c(0,5),methEV="means")

## Examples with a Plot
vbStarts(tl~age,data=SpotVA1,plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="original",plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="GQ",plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Mooij",plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Weisberg",plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Francis",ages2use=c(0,5),plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Schnute",ages2use=c(0,5),plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Somers",plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Somers2",plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Pauly",plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Ogle",valOgle=c(tr=0),plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Ogle",valOgle=c(Lr=8),plot=TRUE)

## Examples where some parameters are fixed by the user
vbStarts(tl~age,data=SpotVA1,fixed=list(Linf=15))
vbStarts(tl~age,data=SpotVA1,fixed=list(Linf=15,K=0.3))
vbStarts(tl~age,data=SpotVA1,fixed=list(Linf=15,K=0.3,t0=-1))
vbStarts(tl~age,data=SpotVA1,fixed=list(Linf=15,K=0.3,t0=-1),plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Pauly",fixed=list(t0=-1.5),plot=TRUE)
vbStarts(tl~age,data=SpotVA1,type="Ogle",valOgle=c(tr=2),fixed=list(Lr=10),plot=TRUE)

## See examples in vbFuns() for use of vbStarts() when fitting Von B models




