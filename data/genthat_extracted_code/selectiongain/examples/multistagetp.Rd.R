library(selectiongain)


### Name: multistagetp
### Title: Function for calculating the truncation points
### Aliases: multistagetp
### Keywords: Truncated multivariate normal

### ** Examples


# first example

VCGCAandError=c(0.40,0.20,0.20,0.40,2.00)
VCSCA=c(0.20,0.10,0.10,0.20)

corr.matrix = multistagecor(maseff=0.40, VGCAandE=VCGCAandError,
VSCA=VCSCA, T=c(1,1,5), L=c(1,3,8), Rep=c(1,1,1))

N1=4500;N2=919;N3=45;Nf=10

Q=multistagetp(c(N2/N1,N3/N2,Nf/N3),  corr=corr.matrix)




