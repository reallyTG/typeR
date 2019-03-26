library(SPA3G)


### Name: WEIGHT_maf
### Title: Returns minor allele frequency based weights
### Aliases: WEIGHT_maf

### ** Examples



## The function is currently defined as
function (G) 
{
    qs <- apply(G, 1, sum)/nrow(G)
    return(1/sqrt(qs))
}



