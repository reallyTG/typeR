library(proportion)


### Name: PloterrEX
### Title: Plots error, long term power and pass/fail criteria using Exact
###   method
### Aliases: PloterrEX

### ** Examples

n=20; alp=0.05;phi=0.05; f=-2;e=0.5 # Mid-p
PloterrEX(n,alp,phi,f,e)
n=20; alp=0.05;phi=0.05; f=-2;e=1 #Clopper-Pearson
PloterrEX(n,alp,phi,f,e)
n=20; alp=0.05;phi=0.05; f=-2;e=c(0.1,0.5,0.95,1) #Range including Mid-p and Clopper-Pearson
PloterrEX(n,alp,phi,f,e)



