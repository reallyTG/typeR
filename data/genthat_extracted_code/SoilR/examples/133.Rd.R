library(SoilR)


### Name: fW.RothC
### Title: Effects of moisture on decomposition rates according to the
###   RothC model
### Aliases: fW.RothC

### ** Examples

P=c(74,59,62,51,52,57,34,55,58,56,75,71) #Monthly Precipitation (mm)
E=c(8,10,27,49,83,99,103,91,69,34,16,8)  #Monthly open pan evaporation (mm)

Rothamsted=fW.RothC(P,E)
data.frame(month.name,P,E,0.75*E,P-0.75*E,Rothamsted)  
# This reproduces Table 1 in the RothC documentation (Coleman and Jenkinson 1999)




