library(FSA)


### Name: Mmethods
### Title: Estimate natural mortality from a variety of empirical methods.
### Aliases: Mmethods metaM print.metaM
### Keywords: manip

### ** Examples

## List names for available methods
Mmethods()
Mmethods("tmax")

## Simple Examples
metaM("tmax",tmax=20)
metaM("tmax",tmax=20,justM=FALSE)
metaM("HoenigNLS",tmax=20)
metaM("HoenigNLS",tmax=20,justM=FALSE)
 
## Example Patagonian Sprat ... from Table 2 in Cerna et al. (2014)
## http://www.scielo.cl/pdf/lajar/v42n3/art15.pdf
Temp <- 11
Linf <- 17.71
K <- 0.78
t0 <- -0.46
tmax <- t0+3/K
t50 <- t0-(1/K)*log(1-13.5/Linf)
metaM("RikhterEfanov1",t50=t50)
metaM("PaulyL",K=K,Linf=Linf,Temp=Temp)
metaM("PaulyL",K=K,Linf=Linf,Temp=Temp,justM=FALSE)
metaM("HoenigNLS",tmax=tmax)
metaM("HoenigO",tmax=tmax)
metaM("HewittHoenig",tmax=tmax)
metaM("AlversonCarney",K=K,tmax=tmax)

## Example of multiple calculations
metaM(c("RikhterEfanov1","PaulyL","HoenigO","HewittHoenig","AlversonCarney"),
     K=K,Linf=Linf,Temp=Temp,tmax=tmax,t50=t50)

## Example of multiple methods using Mmethods
# select some methods
metaM(Mmethods()[-c(15,20,22:24,26)],K=K,Linf=Linf,Temp=Temp,tmax=tmax,t50=t50)
# select just the Hoenig methods
metaM(Mmethods("Hoenig"),K=K,Linf=Linf,Temp=Temp,tmax=tmax,t50=t50)
 



