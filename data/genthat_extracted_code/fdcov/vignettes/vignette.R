## ---- fig.show='hold', message=FALSE, warning=FALSE, cache=TRUE----------
# Load fdcov package
library(fdcov)
# Load in phoneme data
library(fds)
# Setup data arrays
dat1 = rbind( t(aa$y)[1:20,], t(sh$y)[1:20,] );
dat2 = rbind( t(aa$y)[1:20,], t(ao$y)[1:20,] );
dat3 = rbind( dat1, t(ao$y)[1:20,] );
# Setup group labels
grp1 = gl(2,20);
grp2 = gl(2,20);
grp3 = gl(3,20);

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
# Compare two disimilar phonemes (should return TRUE)
ksample.com(dat1,grp1);
# Compare two similar phonemes (should return FALSE)
ksample.com(dat2,grp2);
# Compare three phonemes (should return TRUE)
ksample.com(dat3,grp3);

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
## Create data set
# Load data
data(aa); data(ao); data(dcl); data(iy); data(sh) 
# Select 20 observations from each dataset
dat = cbind(aa$y[,1:20],ao$y[,1:20],dcl$y[,1:20],iy$y[,1:20],sh$y[,1:20]) 
# Input matrix must be of size N (number of observations) X P (number of time points)
dat = t(dat)
# Define cluster labels
grp = c(rep(1,20),rep(2,20),rep(3,20),rep(4,20),rep(5,20)) 

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
## Test the equality of the covariance operators
p = ksample.perm(dat, grp, part = TRUE)

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
p$global # global p-value
p$partial # partial p-values

## ---- fig.show='hold', warning=FALSE, cache=TRUE, fig.align="center"-----
perm.plot(p, 5, lab=c('aa','ao','dcl','iy','sh')) # visualise partial p-values

## ---- fig.show='hold', warning=FALSE, cache=TRUE, fig.align="center"-----
# Load in phoneme data
library(fds)
# Set up test data
dat1 = t(aa$y)[1:20,];
dat2 = t(sh$y)[1:20,];
dat3 = t(aa$y)[21:40,];

## ---- fig.show='hold', warning=FALSE, cache=TRUE, fig.align="center"-----
# Compare two disimilar phonemes
# Resulting in a small p-value
ksample.gauss(dat1,dat2,K=5);
ksample.vstab(dat1,dat2,K=5);
# Compare two sets of the same phonemes 
# Resulting in a large p-value
ksample.gauss(dat1,dat3,K=5);
ksample.vstab(dat1,dat3,K=5);

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
library(fds);
 # Setup training data
dat1 = rbind( 
  t(aa$y[,1:100]), t(ao$y[,1:100]), t(dcl$y[,1:100]), 
  t(iy$y[,1:100]), t(sh$y[,1:100]) 
);
 # Setup testing data
dat2 = rbind( 
  t(aa$y[,101:400]), t(ao$y[,101:400]), t(dcl$y[,101:400]), 
  t(iy$y[,101:400]), t(sh$y[,101:400]) 
);

datgrp = gl(5,100);

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
clCom = classif.com( datgrp, dat1 );

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
grp = predict( clCom, dat2, LOADING=FALSE );
acc = c(
  sum( grp[1:300]==1 ), sum( grp[301:600]==2 ), sum( grp[601:900]==3 ), 
  sum( grp[901:1200]==4 ), sum( grp[1201:1500]==5 )
)/300;
print(rbind(gl(5,1),signif(acc,3)));

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
# Setup data to be clustered
dat  = rbind( t(aa$y[,1:20]),t(iy$y[,1:20]),t(sh$y[,1:20]) );

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
# Cluster data into three groups
clst = cluster.com(dat,grpCnt=3,PRINTLK = FALSE);
matrix(clst,3,20,byrow=TRUE);

## ---- fig.show='hold', warning=FALSE, cache=TRUE-------------------------
# cluster groups of curves
dat  = rbind( t(aa$y[,1:40]),t(iy$y[,1:40]),t(sh$y[,1:40]) );
lab  = gl(30,4);
# Cluster data into three groups
clst = cluster.com(dat,labl=lab,grpCnt=3,PRINTLK = FALSE);
matrix(clst,3,10,byrow=TRUE);

