## ------------------------------------------------------------------------
library(mra)
data("dipper.histories")
dim(dipper.histories)
head(dipper.histories)

## ------------------------------------------------------------------------
ct <- as.factor( paste("T",1:ncol(dipper.histories), sep=""))
attr(ct,"nan")<-nrow(dipper.histories)
ct

## ------------------------------------------------------------------------
dipper1.cjs <- F.cjs.estim( ~tvar(ct,drop=c(1,2)), ~tvar(ct,drop=c(1,6,7)), dipper.histories )
dipper1.cjs

## ------------------------------------------------------------------------
x2 <- matrix(c(0,1,0,0,0,0,0), nrow(dipper.histories), ncol(dipper.histories), byrow=TRUE)
x3 <- matrix(c(0,0,1,0,0,0,0), nrow(dipper.histories), ncol(dipper.histories), byrow=TRUE)
x4 <- matrix(c(0,0,0,1,0,0,0), nrow(dipper.histories), ncol(dipper.histories), byrow=TRUE)
x5 <- matrix(c(0,0,0,0,1,0,0), nrow(dipper.histories), ncol(dipper.histories), byrow=TRUE)
x6 <- matrix(c(0,0,0,0,0,1,0), nrow(dipper.histories), ncol(dipper.histories), byrow=TRUE)
x7 <- matrix(c(0,0,0,0,0,0,1), nrow(dipper.histories), ncol(dipper.histories), byrow=TRUE)

## ------------------------------------------------------------------------
head(x3)
head(x4)

## ------------------------------------------------------------------------
dipper2.cjs <- F.cjs.estim( ~x3+x4+x5+x6+x7, ~x2+x3+x4+x5, dipper.histories )
dipper2.cjs

## ------------------------------------------------------------------------
plot(dipper1.cjs)

## ------------------------------------------------------------------------
plot(dipper1.cjs,type="s",ci=FALSE)

