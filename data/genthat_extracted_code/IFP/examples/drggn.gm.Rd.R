library(IFP)


### Name: drggn
### Title: causal models with G*G
### Aliases: drggn

### ** Examples

### PLI=0.01.
ppt<-0.01



### g*g model

pp<-ppt  # the proportion of G*G component in total populations

gd<-sqrt(pp) # dominant gene proportion = recessive gene proportion
fd<-array(1-sqrt(1-gd^(1/2)),2)  # two dominant genes
tt<-2      # the number of recessive genes: 2

temp<-(pp/gd)^(1/2/tt)
fr<-c(array(0,length(fd)),array(temp,tt))
fd<-c(fd,array(0,tt))

drggn(fd,fr)





