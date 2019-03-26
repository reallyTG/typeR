library(SEERaBomb)


### Name: canc2py
### Title: Converts canc made by mkSEER into a data.frame with py at risk
###   after firsts
### Aliases: canc2py
### Keywords: internal

### ** Examples

## Not run: 
##D rm(list=ls()) 
##D library(SEERaBomb)
##D load("~/data/SEER/mrgd/cancDef.RData") 
##D secS=c("AML","MDS")
##D frstS=c("HL")
##D canc=canc%>%filter(cancer%in%union(frstS,secS))
##D load("~/data/SEER/mrgd/popsae.RData")
##D popsa=popsae%>%group_by(db,race,sex,age,year)%>%summarize(py=sum(py)) # sum on regs
##D pm=seerSet(canc,popsa,Sex="male",ageStart=0,ageEnd=100) 
##D pf=seerSet(canc,popsa,Sex="female",ageStart=0,ageEnd=100) 
##D pm=mk2D(pm,secondS=secS) 
##D pf=mk2D(pf,secondS=secS)
##D brks=c(0,1,5,10)
##D pm=csd(pm,brkst=brks,firstS=frstS) 
##D pf=csd(pf,brkst=brks,firstS=frstS)
##D S=rbind(pf$DF,pm$DF)%>%select(int,t,cancer1,cancer2,O,E) #merge sexes
##D S=S%>%group_by(int,cancer1,cancer2)%>%summarize(O=sum(O),E=sum(E),t=mean(t))
##D S=S%>%mutate(RR=O/E,rrL=qchisq(.025,2*O)/(2*E),rrU=qchisq(.975,2*O+2)/(2*E))
##D S$data="SEER"
##D 
##D ds=canc2py(canc,frstS,secS)
##D S2=esd(ds,pf$D,pm$D,brks)
##D S2=S2%>%group_by(int,cancer1,cancer2)%>%summarize(O=sum(O),E=sum(E),t=mean(t))
##D S2=S2%>%mutate(RR=O/E,rrL=qchisq(.025,2*O)/(2*E),rrU=qchisq(.975,2*O+2)/(2*E))
##D S2$data="SEER2"
##D d=rbind(S,S2)
##D d%>%filter(cancer1=="HL",cancer2=="AML")%>%arrange(int)
##D d%>%filter(cancer1=="HL",cancer2=="MDS")%>%arrange(int) #low because MDS not observable before 2001
##D yrcut=2001  # try to fix it like this
##D ds=ds%>%filter(yeaR+py>yrcut)
##D I=ds$yeaR<yrcut
##D ds$py[I]=(ds$py-(yrcut-ds$yeaR))[I]
##D S2=esd(ds,pf$D,pm$D,brks)
##D S2=S2%>%group_by(int,cancer1,cancer2)%>%summarize(O=sum(O),E=sum(E),t=mean(t))
##D S2=S2%>%mutate(RR=O/E,rrL=qchisq(.025,2*O)/(2*E),rrU=qchisq(.975,2*O+2)/(2*E))
##D S2$data="SEER2"
##D d=rbind(S,S2)
##D d%>%filter(cancer1=="HL",cancer2=="MDS")%>%arrange(int) 
##D #the problem is that esd assumes that py is synched with tsx. csd handles the delays correctly.
##D d%>%filter(cancer1=="HL",cancer2=="MDS")%>%group_by(data)%>%summarize(o=sum(O)) #cases were shifted
## End(Not run)



