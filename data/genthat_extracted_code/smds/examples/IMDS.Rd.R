library(smds)


### Name: IMDS
### Title: Multidimensional scaling of interval-valued dissimilarities.
### Aliases: IMDS

### ** Examples

###################
#Fats and Oil data#
###################
###############################
data(oil.idiss)
#Apply the hypersphere model via the BFGS method
set.seed(1)
res.bfgs <- IMDS(IDM=oil.idiss, p=2,model="sphere",opt.method="BFGS", ini = "auto")
plot(res.bfgs,main="Sph_bfgs")
#Apply the hypersphere model via the MM algorithm
set.seed(1)
res.mm <- IMDS(IDM=oil.idiss, p=2,model="sphere",opt.method="MM", ini = "auto")
plot(res.mm,main="Sph_MM")
#Apply the hyperbox model via the BFGS method
set.seed(1)
res.bfgs <- IMDS(IDM=oil.idiss, p=2,model="box",opt.method="BFGS", ini = "auto")
plot(res.bfgs,main="Box_bfgs")
#Apply the hyperbox model via the MM algorithm
set.seed(1)
res.mm <- IMDS(IDM=oil.idiss, p=2,model="box",opt.method="MM", ini = "auto")
plot(res.mm,main="Box_MM")
###############################



