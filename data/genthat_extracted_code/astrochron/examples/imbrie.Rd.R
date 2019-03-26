library(astrochron)


### Name: imbrie
### Title: Imbrie and Imbrie (1980) ice sheet model
### Aliases: imbrie

### ** Examples

## Not run: 
##D # make a very simple forcing (on/off)
##D forcing=cycles(0,end=300)
##D forcing[50:150,2]=1
##D plot(forcing,type="l")
##D 
##D # use this forcing to drive the imbrie ice model
##D # set b=0, Tm = 1
##D imbrie(forcing,b=0,Tm=1,output=F)
##D 
##D # let's view the evolution of the ice sheet
##D imbrie(forcing,b=0,Tm=1,output=F,genplot=2)
##D 
##D # now increase the response time
##D imbrie(forcing,b=0,Tm=10,output=F,genplot=2)
##D 
##D # now model slow growth, fast decay
##D imbrie(forcing,b=0.5,Tm=10,output=F,genplot=2)
##D 
##D # now make a 100 ka cyclic forcing
##D forcing=cycles(1/100,end=300)
##D imbrie(forcing,b=0,Tm=1,output=F,genplot=2)
##D imbrie(forcing,b=0,Tm=10,output=F,genplot=2)
##D imbrie(forcing,b=0.5,Tm=10,output=F,genplot=2)
##D # show burn-in
##D imbrie(forcing,b=0.5,Tm=10,output=F,genplot=2,burnin=0)
##D 
##D # now examine Malutin Milankovitch's hypothesis: 65 deg N, summer solstice
##D imbrie(b=0.5,Tm=10,output=F,genplot=2,burnin=900)
##D 
##D # use the ice model output to make a synthetic stratigraphic section
##D res=imbrie(b=0.5,T=10,output=T,genplot=1,burnin=100)
##D synthStrat(res,clip=F)
##D 
##D # generate ice model for last 5300 ka, using 65 deg. N insolation, 21 June
##D # allow b and Tm values to change as in Lisiecki and Raymo (2005):
##D insolation=getLaskar("insolation")
##D insolation=iso(insolation,xmin=0,xmax=5300)
##D #  b is 0.3 from 5300 to 3000 ka, then linearly increases to 0.6 between 3000 and 1500 ka.
##D #  b is 0.6 from 1500 ka to present.
##D set_b=linterp(cb(c(1500,3000),c(0.6,0.3)),dt=1)
##D set_b=rbind(set_b,c(5400,0.3))
##D #  Tm is 5 ka from 5300 to 3000 ka, then linearly increases to 15 ka between 3000 and 1500 ka.
##D #  Tm is 15 ka from 1500 ka to present.
##D set_Tm=linterp(cb(c(1500,3000),c(15,5)),dt=1)
##D set_Tm=rbind(set_Tm,c(5400,5))
##D # now run model
##D ex=imbrie(insolation=insolation,Tm=set_Tm[,2],b=set_b[,2],times=set_b[,1])
##D # time-frequency analysis of model result
##D eha(ex,fmax=0.1,win=500,step=10,pad=5000,genplot=4,pl=2)
##D 
## End(Not run)



