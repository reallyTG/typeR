library(CDVine)


### Name: CDVineTreePlot
### Title: Plot function for C- or D-vine trees
### Aliases: CDVineTreePlot

### ** Examples

# simulate from a 6-dimensional C-vine model with Gaussian pair-copulas
d = 6
dd = d*(d-1)/2
par1 = c(0.2,0.69,0.73,0.22,-0.09,0.51,0.32,0.01,0.82,0.01,-0.2,
         -0.32,-0.19,-0.17,-0.06);
fam1 = rep(1,dd)
N = 100
U = CDVineSim(N,fam1,par1,type=1)

# plot the first tree with pair-copula families and
# empirical Kendall's tau values as edge labels
CDVineTreePlot(U,fam1,type=1,tree=1,edge.labels=c("family","emptau"))

# plot all trees without edge labels and without sequential estimation
CDVineTreePlot(data=NULL,family=fam1,par=par1,type=1, edge.labels=FALSE)



