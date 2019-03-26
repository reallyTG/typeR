library(proportion)


### Name: PlotpCOpBIEX
### Title: Plots of p-confidence and p-bias of Exact method given n and
###   alpha level
### Aliases: PlotpCOpBIEX

### ** Examples

n=5; alp=0.05;e=0.5; # Mid-p
PlotpCOpBIEX(n,alp,e)
n=5; alp=0.05;e=1; #Clopper-Pearson
PlotpCOpBIEX(n,alp,e)
n=5; alp=0.05;e=c(0.1,0.5,0.95,1); #Range including Mid-p and Clopper-Pearson
PlotpCOpBIEX(n,alp,e)



