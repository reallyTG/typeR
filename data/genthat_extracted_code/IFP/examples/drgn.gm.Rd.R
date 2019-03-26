library(IFP)


### Name: drgn
### Title: causal models with G
### Aliases: drgn

### ** Examples

### PLI=0.01.
ppt<-0.01



### g model

pp<-ppt  # the proportion of G component in total populations

fdt<-0.001 # one dominant gene with frequency of 0.001
tt<-5      # the number of recessive genes: 5

fd<-c(fdt,array(0,tt))
temp<-sqrt(1-((1-pp)/(1-fdt)^2)^(1/tt))
fr<-c(0,array(temp,tt))

drgn(fd,fr)





