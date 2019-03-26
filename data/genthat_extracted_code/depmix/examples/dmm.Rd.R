library(depmix)


### Name: dmm
### Title: Dependent Mixture Model Specifiction
### Aliases: dmm summary.dmm lcm lca
### Keywords: models

### ** Examples


# create a 2 state model with one continuous and one binary response
# with start values provided in st
st <- c(1,0.9,0.1,0.2,0.8,2,1,0.7,0.3,5,2,0.2,0.8,0.5,0.5)
mod <- dmm(nsta=2,itemt=c(1,2), stval=st)
summary(mod)

# 2 class latent class model with equal conditional probabilities in each class
stv=c(1,rep(c(0.9,0.1),5),rep(c(0.1,0.9),5),0.5,0.5)
# here the conditional probs of the first item are set equal to those in
# the subsequent items
conpat=c(1,rep(c(2,3),5),rep(c(4,5),5),1,1)
lc=lca(ncl=2,itemtypes=rep(2,5),conpat=conpat,stv=stv)
summary(lc)




