library(proportion)


### Name: ciEXx
### Title: Exact method of CI estimation
### Aliases: ciEXx

### ** Examples

x=5; n=5; alp=0.05;e=0.5
ciEXx(x,n,alp,e) #Mid-p
x=5; n=5; alp=0.05;e=1 #Clopper Pearson
ciEXx(x,n,alp,e)
x=5; n=5; alp=0.05;e=c(0.1,0.5,0.95,1) #Range including Mid-p and Clopper-Pearson
ciEXx(x,n,alp,e)



