library(IFP)


### Name: iter.mcmc
### Title: mcmc inference of causal models with all possible causal
###   factors: G, G*G, G*E and E
### Aliases: iter.mcmc

### ** Examples

### PLI=0.01.
ppt<-0.01



### a simple causal model with G and E components

pg<-0.007  # the proportion of G component in total populations
pgg<-0  # the proportion of G*G component in total populations
pge<-0  # the proportion of G*E component in total populations
e<-1-(1-ppt)/(1-pg)   # the proportion of E component in total populations

fd<-0.001  # one dominant gene
tt<-3      # the number of recessive genes

temp<-sqrt(1-((1-pg)/(1-fd)^2)^(1/tt))
fr<-c(array(0,length(fd)),array(temp,tt))
fd<-c(fd,array(0,tt))

rp<-drgegggne(fd,fr,c(0,0),c(0,0),c(0,0),c(0,0),0,e)

sdata<-rp[,3]/(rp[,2]+rp[,3])
#sdata<-round(sdata*500)

darray<-c(1:2,4:6)  
  ## available data= MZT, P-O, sibs, grandparent-grandchild, avuncular pair
n<-array(1000,length(darray))
x<-array()
for(i in 1:length(darray)){
x[i]<-rbinom(1,n[i],sdata[darray[i]])
}
model<-c(1,1,0,0)

## remove # from the following lines to test examples.
#iter.mcmc(ppt,2,15,2,1,1,darray,x,n,model) # provide a running test
#iter.mcmc(ppt,2,2000,2,10,500,darray,x,n,model) # provide a proper result




