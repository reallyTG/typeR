library(proportion)


### Name: pCOpBIEX
### Title: p-confidence and p-bias for Exact method given n and alpha level
### Aliases: pCOpBIEX

### ** Examples

n=5; alp=0.05;e=0.5
pCOpBIEX(n,alp,e)
n=5; alp=0.05;e=1 #Clopper-Pearson
pCOpBIEX(n,alp,e)
n=5; alp=0.05;e=c(0.1,0.5,0.95,1) #Range including Mid-p and Clopper-Pearson
pCOpBIEX(n,alp,e)



