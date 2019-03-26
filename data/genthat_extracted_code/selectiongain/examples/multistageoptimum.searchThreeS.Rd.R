library(selectiongain)


### Name: multistageoptimum.searchThreeS
### Title: Function for optimizing four-stage selection in plant breeding
###   with one marker-assisted selection stage and three phenotypic
###   selection stages
### Aliases: multistageoptimum.searchThreeS
### Keywords: Optimization

### ** Examples

#VCGCAandError=c(0.4,0.2,0.2,0.4,2)
#VCSCA=c(0.2,0.1,0.1,0.2)

# example 1: restriction on the number of location and genotypes
# for phenotypic stages 2 and 3
#multistageoptimum.searchThreeS(maseff=NA, VGCAandE=VCGCAandError, VSCA=VCSCA,
#CostProd=c(1,4,4,4), CostTest=c(0,1,1,1), Nf=3, Budget=3000,
#N2grid=c(100,500,50),N3grid=c(10,50,5), N4grid=c(10,50,5),
#L2grid=c(1,2,1), L3grid=c(9,10,1), L4grid=c(9,10,1),
#T2grid=c(1,2,1), T3grid=c(5,6,1), T4grid=c(5,6,1),
#R2=1, R3=1, R4=1, alg=Miwa(), detail=FALSE, fig= FALSE, t2free=TRUE)

# example 2: More flexible number of location and genotypes
# for phenotypic stages 2 and 3

#multistageoptimum.searchThreeS(maseff=NA, VGCAandE=VCGCAandError, VSCA=VCSCA,
#       CostProd=c(1,4,4,4), CostTest=c(0,1,1,1), Nf=3, Budget=3000,
#       N2grid=c(100,500,50),N3grid=c(10,50,5), #N4grid=c(10,50,5),
#      L2grid=c(2,3,1), L3grid=c(7,8,1), #L4grid=c(9,10,1),
#      T2grid=c(2,3,1), T3grid=c(2,3,1), #T4grid=c(7,8,1),
#      R2=1, R3=1, R4=1, alg=Miwa(), detail=FALSE, #fig= FALSE, t2free=TRUE)




