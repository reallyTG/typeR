library(REPPlab)


### Name: screeplot.epplab
### Title: Creating a Screeplot for an epplab Object
### Aliases: screeplot,epplab-method screeplot-method screeplot.epplab
### Keywords: hplot

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10],PPalg="PSO",PPindex="KurtosisMin",n.simu=10, maxiter=20)
screeplot(res)

# Pretty useless:
screeplot(res,type="barplot")

screeplot(res,which=1:5)




