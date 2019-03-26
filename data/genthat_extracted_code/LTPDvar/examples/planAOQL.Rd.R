library(LTPDvar)


### Name: planAOQL
### Title: Calculation of AOQL plan for sampling inspection by variables
### Aliases: planAOQL
### Keywords: misc

### ** Examples

# find AOQL plan
planAOQL(N=1000,pbar=0.005,pL=0.01, method="napprox", cm=1.5);
planAOQL(N=8000, pbar=0.003, pL=0.01, cm=1.5,method="ewmaSK", lam=0.9,intdif=40);
planAOQL(N=8000, pbar=0.003, pL=0.01, cm=1.5,method="ewma2", lam=0.9);



