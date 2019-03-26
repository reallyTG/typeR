library(highD2pop)


### Name: highD2pop-package
### Title: Two-sample tests for equality of means in high dimension
### Aliases: highD2pop-package highD2pop
### Keywords: package

### ** Examples

	
	
data(chr1qseg)

impute<-function(x) { 	x[which(is.na(x))] <- mean(x,na.rm=TRUE)
						return(x)
					}

X <- apply(chr1qseg$X,2,impute)
Y <- apply(chr1qseg$Y,2,impute)

## on imputed data with no missing values:

ChenQin.test(X,Y)
GCT.test(X,Y,r=20,smoother="parzen")
SK.test(X,Y)

## on raw data with missing values:

GCT.test.missing(chr1qseg$X,chr1qseg$Y,r=20,smoother="parzen")




