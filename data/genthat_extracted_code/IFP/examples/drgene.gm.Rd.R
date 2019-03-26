library(IFP)


### Name: drgene
### Title: causal models with G*E and E
### Aliases: drgene

### ** Examples

### PLI=0.01.
ppt<-0.01



### g*e+e model

pge<-0.007  # the proportion of G*E component in total populations
e<-1-(1-ppt)/(1-pge)   # the proportion of E component in total populations

ppe<-0.5
ppg<-pge/ppe

fd<-0.0005  # one dominant gene
tt<-3      # the number of recessive genes

temp<-sqrt(1-((1-ppg)/(1-fd)^2)^(1/tt))
fr<-c(array(0,length(fd)),array(temp,tt))
fd<-c(fd,array(0,tt))

drgene(fd,fr,ppe,e)





