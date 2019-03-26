library(mra)


### Name: print.nhat
### Title: print.nhat
### Aliases: print.nhat
### Keywords: models

### ** Examples

# Fit CJS model to dipper data, time-varying capture and survivals.
data(dipper.histories)

# Method 1: explicit matricies
xy <- F.cjs.covars( nrow(dipper.histories), ncol(dipper.histories) )
for(j in 1:ncol(dipper.histories)){ assign(paste("x",j,sep=""), xy$x[,,j]) } 
dipper.cjs <- F.cjs.estim( ~x2+x3+x4+x5+x6, ~x1+x2+x3+x4+x5, dipper.histories )
print(dipper.cjs)

# Method 2: indicator vectors
x <- factor(1:ncol(dipper.histories), labels=paste("t",1:ncol(dipper.histories),sep=""))
nd <- nrow(dipper.histories)
dipper.cjs <- F.cjs.estim( ~tvar(x,nan=nd,drop=c(1,7)), ~tvar(x,nan=nd,drop=c(6,7)), 
    dipper.histories)
print(dipper.cjs)




