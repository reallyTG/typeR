library(MRwarping)


### Name: TICdata
### Title: TIC data.
### Aliases: TICdata
### Keywords: datasets

### ** Examples

data(TICdata)
TIC=as.matrix(TICdata)

## Preparation of the TIC data for use in warping.

# for smoothing the LC-MS data TIC
library("SemiPar")

index = 1:200*2-1
TICy = t(matrix(index,200,11))
TIC = as.matrix(TICdata)
x = 1:400
for (i in 1:11)
	{
	TIC.sm = spm(TIC[i,]~f(x))
	TICy[i,] = TIC.sm$fit$fitted[index]
	}
TICx = t(matrix(index,200,11))



