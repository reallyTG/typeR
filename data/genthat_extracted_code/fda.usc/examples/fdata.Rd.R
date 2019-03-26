library(fda.usc)


### Name: fdata
### Title: Converts raw data or other functional data classes into fdata
###   class.
### Aliases: fdata
### Keywords: manip

### ** Examples


data(phoneme)
mlearn<-phoneme$learn[1:4,1:150]
# Center curves
fdata.c=fdata.cen(mlearn)$Xcen
par(mfrow=c(2,1))
plot.fdata(mlearn,type="l")
plot.fdata(fdata.c,type="l")

# Convert  from class fda to fdata
bsp1 <- create.bspline.basis(c(1,150),21)
fd1 <- Data2fd(1:150,y=t(mlearn$data),basisobj=bsp1)
fdataobj=fdata(fd1)

# Convert  from class fds, fts or sfts to fdata
#require(fds)
#a=fds(x = 1:20, y = Simulationdata$y, xname = "x", 
# yname = "Simulated value")
#b=fts(x = 15:49, y = Australiasmoothfertility$y, xname = "Age",
#    yname = "Fertility rate")
#c=sfts(ts(as.numeric(ElNino$y), frequency = 12), xname = "Month",
#yname = "Sea surface temperature")
#class(a);class(b);class(c)
#fdataobj=fdata(b)




