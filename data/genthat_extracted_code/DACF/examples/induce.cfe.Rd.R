library(DACF)


### Name: induce.cfe
### Title: induce.cfe
### Aliases: induce.cfe

### ** Examples

x=rnorm(1000,0,1) #simulate "healthy data"
x.c20=induce.cfe(0,.2,x) #induce 20% ceiling effects into the data
sum(x.c20==max(x.c20))/length(x.c20) #check ceiling percentage
x.f20=induce.cfe(.2,0,x) #induce 20% floor effects into the data
sum(x.f20==min(x.f20))/length(x.f20) #check ceiling percentage



