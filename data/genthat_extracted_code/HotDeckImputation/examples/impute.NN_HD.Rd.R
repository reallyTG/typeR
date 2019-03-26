library(HotDeckImputation)


### Name: impute.NN_HD
### Title: The Nearest Neighbor Hot Deck Algorithms
### Aliases: impute.NN_HD
### Keywords: NA manip optimize multivariate

### ** Examples

#Set the random seed to an arbitrary number
set.seed(421)

#Generate random integer matrix size 10x4
Y<-matrix(sample(x=1:100,size=10*4),nrow=10)

#remove 5 values, ensuring one complete covariate and 5 donors
Y[-c(1:5),-1][sample(1:15,size=5)]<-NA

#Impute using various different (arbitrarily chosen) settings
impute.NN_HD(DATA=Y,distance="man",weights="var")

impute.NN_HD(DATA=Y,distance=2,weights=rep(.5,4),donor_limit=2,optimal_donor="mmin")

impute.NN_HD(DATA=Y,distance="eukl",weights=.25,comp="mean",donor_limit=1,
 optimal_donor="odd")
 
#Recover some diagnostics
impute.NN_HD(DATA=Y,distance="eukl",weights=.25,comp="mean",donor_limit=1,
 optimal_donor="odd",diagnose = "diagnostics")
# look at the diagnostics
 diagnostics



