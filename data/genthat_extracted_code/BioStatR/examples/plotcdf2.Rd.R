library(BioStatR)


### Name: plotcdf2
### Title: Représentation bivariée des variables discrètes ou des variables
###   continues groupées en classes.
### Aliases: plotcdf2
### Keywords: univar

### ** Examples

xx=c(1.83,1.72,1.65,1.70,2.05,1.92,1.85,1.70,1.75,1.9)
yy=c(75,70,70,60,90,92,75,68,71,87)
plotcdf2(xx,yy,f=0,"taille en m","poids en kg")

xx=seq(2,12)
yy=seq(1,6)                 
p=c(1/36,0,0,0,0,0,
2/36,0,0,0,0,0,
2/36,1/36,0,0,0,0,
2/36,2/36,0,0,0,0,
2/36,2/36,1/36,0,0,0,
2/36,2/36,2/36,0,0,0,
0,2/36,2/36,1/36,0,0,
0,0,2/36,2/36,0,0,
0,0,0,2/36,1/36,0,
0,0,0,0,2/36,0,
0,0,0,0,0,1/36)
p=matrix(p,byrow=TRUE,ncol=6)
plotcdf2(xx,yy,p,"somme des dés","valeur du plus petit")



