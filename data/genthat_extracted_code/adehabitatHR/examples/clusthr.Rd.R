library(adehabitatHR)


### Name: clusthr
### Title: Estimation of the Home Range by Single-Linkage Cluster Analysis
### Aliases: clusthr
### Keywords: spatial hplot

### ** Examples


data(puechabonsp)
lo<-puechabonsp$relocs[,1]

## Home Range Estimation
res <- clusthr(lo)

## Displays the home range
plot(res)

## Computes the home range size
MCHu2hrsize(res)

## get the 95 percent home range:
plot(getverticeshr(res, percent=95))





