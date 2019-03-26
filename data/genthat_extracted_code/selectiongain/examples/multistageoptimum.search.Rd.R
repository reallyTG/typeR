library(selectiongain)


### Name: multistageoptimum.search
### Title: Function for optimizing three-stage selection in plant breeding
###   with one marker-assisted selection stage and two phenotypic selection
###   stages
### Aliases: multistageoptimum.search
### Keywords: Optimization

### ** Examples


CostProd =c(0.5,1,1)
CostTest = c(0.5,1,1)
Budget=1021
# Budget is very small here to save time in package checking
# for the example in Heffner's paper, please change it to Budget=10021

VCGCAandError=c(0.4,0.2,0.2,0.4,2)
VCSCA=c(0.2,0.1,0.1,0.2)
Nf=10


multistageoptimum.search (maseff=0.4, VGCAandE=VCGCAandError, 
VSCA=VCSCA, CostProd = c(0.5,1,1), CostTest = c(0.5,1,1), 
Nf = 10, Budget = Budget, N2grid = c(11, 1211, 30), 
N3grid = c(11, 211, 5), L2grid=c(1,1,1), L3grid=c(6,6,1),
T2grid=c(1,2,1), T3grid=c(3,5,1), R2=1, R3=1, alg = Miwa(), 
detail=TRUE, fig=TRUE)





