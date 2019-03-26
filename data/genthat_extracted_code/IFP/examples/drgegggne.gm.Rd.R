library(IFP)


### Name: drgegggne
### Title: causal models with all possible causal factors: G, G*G, G*E and
###   E
### Aliases: drgegggne

### ** Examples

### PLI=0.01.
ppt<-0.01



### for a model without one or more missing causal factors, 
### set the relevant parameters as zero.

pg<-0.002  # the proportion of G component in total populations
pgg<-0.002  # the proportion of G*G component in total populations
pge<-0.003  # the proportion of G*E component in total populations
e<-1-(1-ppt)/(1-pg)/(1-pgg)/(1-pge)   
   # the proportion of E component in total populations

fd<-0.001  # one dominant gene
tt<-3      # the number of recessive genes

temp<-sqrt(1-((1-pg)/(1-fd)^2)^(1/tt))
fr<-c(array(0,length(fd)),array(temp,tt))
fd<-c(fd,array(0,tt))

ppd<-sqrt(pgg)
fdg<-array(1-sqrt(1-ppd^(1/2)),2)
ttg<-1
temp<-(pgg/ppd)^(1/2/ttg)
frg<-c(array(0,length(fdg)),array(temp,ttg))
fdg<-c(fdg,array(0,ttg))

ppe<-0.5
ppg<-pge/ppe

fdge<-0.002
ttge<-2      # the number of recessive genes

temp<-sqrt(1-((1-ppg)/(1-fdge)^2)^(1/ttge))
frge<-c(array(0,length(fdge)),array(temp,ttge))
fdge<-c(fdge,array(0,ttge))


drgegggne(fd,fr,fdg,frg,fdge,frge,ppe,e)





