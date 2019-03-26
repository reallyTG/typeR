library(BinNor)


### Name: jointly.generate.binary.normal
### Title: Generates mixed data
### Aliases: jointly.generate.binary.normal

### ** Examples


no.rows=100
no.bin=2; no.nor=2
mean.vec.nor=c(3,1); var.nor=c(4,2)
prop.vec.bin=c(0.4,0.7)
corr.vec=c(0.16,0.04,0.38,0.14,0.47,0.68);

cmat = lower.tri.to.corr.mat(corr.vec,4)
sigma.star=compute.sigma.star(no.bin=2, no.nor=2, prop.vec.bin=c(0.4,0.7),
								corr.mat=cmat)
mydata=jointly.generate.binary.normal(no.rows,no.bin,no.nor,prop.vec.bin,
				mean.vec.nor,var.nor, sigma_star=sigma.star$sigma_star, 
				continue.with.warning=TRUE)



