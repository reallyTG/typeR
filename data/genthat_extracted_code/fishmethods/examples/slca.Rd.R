library(fishmethods)


### Name: slca
### Title: A Weakly Parametric Method for the Analysis of Length
###   Composition Data
### Aliases: slca
### Keywords: misc

### ** Examples


#Data are from Shepherd working document - seasonal length frequencies
# for Raja clavata.
data(Shepherd)

#explore
slca(Shepherd,1,fryr=c(0.2,0.45,0.80),Lrange=c(100,150,10),
Krange=c(0.1,0.3,0.02))

#evaluate
slca(Shepherd,2,fryr=c(0.2,0.45,0.80),Linf=120,K=0.2,t0=0.57)




