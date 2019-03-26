library(matie)


### Name: fdg
### Title: Force directed graph visualization of associations between all
###   pairs of variables.
### Aliases: fdg

### ** Examples

    data(baseballData)
    fdg(baseballData,dataName="baseballData",method="A",cutoff=0.35,dim=2)
    
    # if you have rgl available then try dim=3 
    # fdg(baseballData,dataName="baseballData",method="Rsq",cutoff=0.15,dim=3)



