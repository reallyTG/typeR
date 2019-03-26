library(proportion)


### Name: PlotciEXx
### Title: Plots the CI estimation of the exact method
### Aliases: PlotciEXx

### ** Examples

x=5; n=5; alp=0.05;e=0.5
PlotciEXx(x,n,alp,e) #Mid-p
x=5; n=5; alp=0.05;e=1 #Clopper Pearson
PlotciEXx(x,n,alp,e)
x=5; n=5; alp=0.05;e=c(0.1,0.5,0.95,1) #Range including Mid-p and Clopper-Pearson
PlotciEXx(x,n,alp,e)



