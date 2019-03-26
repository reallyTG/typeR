library(selectiongain)


### Name: multistageoptimum.grid
### Title: Function for optimizing multi-stage selection with grid
###   algorithm for a given correlation matrix
### Aliases: multistageoptimum.grid
### Keywords: Optimization

### ** Examples

corr=matrix( c(1,       0.3508,0.3508,0.4979,
               0.3508  ,1,     0.3016,0.5630,
               0.3508,  0.3016,1     ,0.5630,
               0.4979,  0.5630,0.5630,1), 
              nrow=4  
)

Budget=200

multistageoptimum.grid( Vg=1, num.grid=11, corr=corr, Budget=Budget,
 CostProd=c(0.5,0,0), CostTest=c(0.5,1,1), Nf=5, 
N.upper=rep(Budget,3), N.lower=rep(1,3))

multistageoptimum.grid( Vg=1, num.grid=11, corr=corr, Budget=Budget,
 CostProd=c(0.5,0,0), CostTest=c(0.5,1,1), Nf=5, 
N.upper=rep(Budget,3), N.lower=rep(1,3),detail=TRUE,fig=TRUE)






