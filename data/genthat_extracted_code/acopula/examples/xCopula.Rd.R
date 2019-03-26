library(acopula)


### Name: xCopula
### Title: Archimax and generic copula distribution functions
### Aliases: cCopula dCopula eCopula gCopula pCopula qCopula rCopula
###   isCopula eCopulaArchimax eCopulaGeneric gCopulaEmpirical
###   pCopulaEmpirical rCopulaArchimax2D print.eCopulaArchimax
###   print.eCopulaGeneric print.gCopula print.isCopula
### Keywords: cumulative distribution function probability density function
###   conditional probability quantile sampling empirical copula
###   goodness-of-fit test d-increasing maximum likelihood inverse of
###   correlation coefficient

### ** Examples

## assign generator definition list with specific parameter
ge <- genGumbel(parameters=4)

## probability P(U<0.3,V<0.5)
pCopula(c(0.3,0.5),ge)  #0.2906142
## quantile q for which P(U<q,V<0.5)=0.2906142
pCopula(c(0.2906142,0.5),ge,quantile=1)  #0.3000175
pCopula(c(NA,0.5),ge,quantile=1,probability=0.2906142)
qCopula(c(0.5),quantile=1,probability=0.2906142,generator=ge)

## conditional probability P(U<0.3|V=0.5)
cCopula(c(0.3,0.5),ge,conditional.on=2)  #0.1025705
## quantile q for which conditional probability P(U<q|V=0.5)=0.1025705
cCopula(c(0.1025705,0.5),conditional.on=2,generator=ge,quantile=1)  #0.2999861
cCopula(c(NA,0.5),conditional.on=2,generator=ge,quantile=1,probability=0.1025705)
qCopula(c(0.5),quantile=1,probability=0.1025705,conditional.on=2,generator=ge)

## copula density
dCopula(c(0.3,0.5),ge) #1.083797
local({
x <- y <- seq(0,1,length.out=20)
persp(x,y,matrix(dCopula(expand.grid(x,y),ge),nrow=length(x)),r=2,zlab="density")
})

## simulate random vector
rge <- rCopula(100,dim=2,ge) 
plot(rge)
# Observe that using rCopula(100,dim=2,cop=copGumbel(parameters=4)) 
# would take much more time to sample, since numerical derivative needs to be employed. 

## --- fit copula to data set
# maximum likelihood (using density)
eCopula(rge,ge,technique="ML")
# some methods has no support for parameters bounds (do not mind a warning message)
eCopula(rge,ge,technique="ML",method="BFGS")  
# least-square fit to empirical copula
eCopula(rge,ge,technique="LS",procedure="nlminb")  
# maximizing discretized likelihood function
eCopula(rge,ge,technique="ML",procedure="grid",glimits=list(2.,6.),pgrid=20)  
# specify nodes of the grid
eCopula(rge,ge,tech="ML",proc="grid",ggridparameters=list(c(2.,6.,length.out=20))) 
# without naming, it won't create sequence
eCopula(rge,ge,technique="ML",procedure="grid",ggridparameters=list(c(2.,6.,20)))
# inversion of Kendall's tau
eCopula(rge,ge,technique="icorr",corrtype="kendall")

## --- GoF test, set substantially higher N to increase precision of p-value
gCopula(rge,ge,etechnique="ML",N=5)
# parallel computing takes lesser time, but the progress is not displayed
# not available on Windows OS
if(.Platform$OS.type!="windows") {
  gCopula(rge,ge,etechnique="ML",N=5,ncores=2)
}

## testing if two data sets has equal copulas
rge1 <- rCopula(80,dim=2,genClayton(),gpars=3)
gCopula(list(rge,rge1),N=5)

## check whether some hypotheticaly-copula function does not violate  
## copula properties (over data and parameters grid)
isCopula(genGumbel(),dagrid=10,pgrid=10,tolerance=1e-15)

## all the above functions are ready for archimax or generic copulas 
## as well as for higher dimensions
pCopula(c(0.3,0.5,1.0),genClayton(),depGumbel(),gpars=0.01,dpars=4.)  #0.2907613
pCopula(c(0.3,0.5,1.0),copula=copGumbel(),pars=4.)  #0.2906142




