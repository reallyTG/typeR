library(MRwarping)


### Name: MRwarp
### Title: Main function to perform multiresolution warping for functional
###   data in a Bayesian way.
### Aliases: MRwarp

### ** Examples

data(TICdata)
TIC = as.matrix(TICdata)

index = 1:200*2-1
TICy = t(matrix(index,200,11))
x = 1:400
for (i in 1:11)
	{
	TIC.sm = spm(TIC[i,]~f(x))
	TICy[i,] = TIC.sm$fit$fitted[index]
	}
TICx = t(matrix(index,200,11))
kernel.s = c(70,100,130,270,285,300)

## Not run: 
##D output = MRwarp(Xdata=TICx,Ydata=TICy,chain=100,thin=5,burnin=50,kernel.s,
##D components=1,selection="FIXED",shr=0.3,outputfit=1,alpha=0.1)
## End(Not run)



