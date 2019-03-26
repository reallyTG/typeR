library(mratios)


### Name: plot.sci.ratio
### Title: Plot output for sci.ratio and sci.ratio.gen
### Aliases: plot.sci.ratio
### Keywords: hplot htest

### ** Examples


library(mratios)

data(angina)

aCI<-sci.ratio(response~dose, data=angina, type="Dunnett",
 alternative="greater")

# Visualize testing for superiority

plot(aCI, rho0=1.25, rho0lty=3)






