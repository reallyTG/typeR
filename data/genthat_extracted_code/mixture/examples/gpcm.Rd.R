library(mixture)


### Name: gpcm
### Title: Gaussian Parsimonious Clustering Models
### Aliases: gpcm
### Keywords: multivariate cluster classif

### ** Examples

data("x2")

# use k-means starts
ax0 = gpcm(x2, G=1:5, mnames=c("VVV", "EVE"),start=0, pprogress=TRUE, atol=1e-2)
summary(ax0)
ax0

# use 6 random values for starting values
ax6 = gpcm(x2, G=1:5, mnames=c("VVV", "EVE"),start= 2, atol=1e-2)
summary(ax6)
ax6

# use deterministic annealing for starting values
#axNULL = gpcm(x2, G=1:5, mnames=c("VVV", "EVE"), start=NULL, atol=1e-2)
#summary(axNULL)
#axNULL

# use your own deterministic annealing values for starting values
#vseq0 = rep(seq(.05, 1, length.out=5),each=2)
#axv = gpcm(x2, G=1:5, mnames=c("VVV", "EVE"), start=vseq0, atol=1e-2)
#summary(axv)
#axv

# Initialization using your own function 
igparhc <-  function(data=NULL, g=NULL,covtype=NULL) {
	lw = cutree(hclust(dist(data), "complete"),k=g)
	w = matrix(0, nrow=nrow(data), ncol=g)
	for (j in 1:ncol(w)) w[,j] = as.numeric( lw ==j )
	return(w)
}
axhclust = gpcm(x2, G=1:5, mnames=c("VVV", "EVE"),start= igparhc, atol=1e-2)
summary(axhclust)
axhclust

# Estimate all 14 covariance structures from k-means starts 
ax = gpcm(x2, G=1:5, start=0, atol=1e-2)
summary(ax)
ax

# model based classification
x2.label = numeric(nrow(x2))
x2.label[c(10,50, 110, 150, 210, 250)] = c(1,1,2,2,3,3)
plot(x2, col=x2.label)
axl = gpcm(x2, G=3:5, mnames=c("VVV", "EVE"), label=x2.label, atol=1e-2)




