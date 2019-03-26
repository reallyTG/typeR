library(LTPDvar)


### Name: planLTPD
### Title: Calculation of LTPD plan for sampling inspection by variables
### Aliases: planLTPD
### Keywords: misc

### ** Examples

# find LTPD plan
planLTPD(N=1000,pt=0.1,pbar=0.001);
planLTPD(1000, 0.01,0.001,cm=1.5,b=0.1,method="ewmaSK",lam=0.9,intdif=60);
planLTPD(1000, 0.01,0.001,cm=1.5,b=0.1,method="ewma2",lam=0.9);



