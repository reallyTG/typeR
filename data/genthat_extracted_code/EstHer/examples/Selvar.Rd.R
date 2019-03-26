library(EstHer)


### Name: Selvar
### Title: Estimation of heritability in high dimensional sparse linear
###   mixed models using variable selection.
### Aliases: Selvar
### Keywords: variable selection heritability linear mixed models

### ** Examples

library(EstHer)
data(Y)
data(W)
data(X)
Z=scale(W,center=TRUE,scale=TRUE)
res=Selvar(Y,Z,X,thresh_vect=c(0.7,0.8,0.9),nb_boot=80,nb_repli=50,CI_level=0.95,nb_cores=1) 
res$heritability
res$CI_low
res$CI_up



