library(proportion)


### Name: ciEX
### Title: Exact method of CI estimation
### Aliases: ciEX

### ** Examples

n=5; alp=0.05;e=0.5
ciEX(n,alp,e) #Mid-p
n=5; alp=0.05;e=1 #Clopper-Pearson
ciEX(n,alp,e)
n=5; alp=0.05;e=c(0.1,0.5,0.95,1) #Range including Mid-p and Clopper-Pearson
ciEX(n,alp,e)



