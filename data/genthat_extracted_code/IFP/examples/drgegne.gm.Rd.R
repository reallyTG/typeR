library(IFP)


### Name: drgegne
### Title: causal models with three possible causal factors: G, G*E and E
### Aliases: drgegne

### ** Examples

### PLI=0.01.
ppt<-0.01



pg<-0.002  # the proportion of G component in total populations
pge<-0.005  # the proportion of G*E component in total populations
e<-1-(1-ppt)/(1-pg)/(1-pge)   
  # the proportion of E component in total populations

fd<-0.001  # one dominant gene
tt<-2      # the number of recessive genes

temp<-sqrt(1-((1-pg)/(1-fd)^2)^(1/tt))
fr<-c(array(0,length(fd)),array(temp,tt))
fd<-c(fd,array(0,tt))

ppe<-0.5
ppg<-pge/ppe

fdge<-0.002
ttge<-2      # the number of recessive genes

temp<-sqrt(1-((1-ppg)/(1-fdge)^2)^(1/ttge))
frge<-c(array(0,length(fdge)),array(temp,ttge))
fdge<-c(fdge,array(0,ttge))


drgegne(fd,fr,fdge,frge,ppe,e)





