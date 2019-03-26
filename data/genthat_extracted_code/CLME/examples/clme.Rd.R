library(CLME)


### Name: clme
### Title: Constrained Inference for Linear Mixed Effects Models
### Aliases: clme

### ** Examples

data( rat.blood )
cons <- list(order="simple", decreasing=FALSE, node=1 )

clme.out <- clme(mcv ~ time + temp + sex + (1|id), data=rat.blood , 
                 constraints=cons, seed=42, nsim=10 )




