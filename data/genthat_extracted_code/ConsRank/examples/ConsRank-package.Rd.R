library(ConsRank)


### Name: ConsRank-package
### Title: Compute the Median Ranking According to the Kemeny's Axiomatic
###   Approach
### Aliases: ConsRank-package ConsRank
### Keywords: Median ranking Consensus ranking Kemeny distance Tau_X rank
###   correlation coefficient Branch-and-bound algorithms Differential
###   evolution algorithms

### ** Examples

## load APA data set, full version
data(APAFULL)
## Emond and Mason Branch-and-Bound algorithm. 
## If the number of object is higher than 20, EMCons function may work for several minutes. 
## Use either QuickCons, DECOR, FASTcons or FASTDECOR instead
CR=EMCons(APAFULL)
TR=tabulaterows(APAFULL)
CR2=FASTcons(TR$X,TR$Wk,maxiter=5)
CR3=QuickCons(TR$X,TR$Wk)
CR4=DECOR(TR$X,TR$Wk)

#####################################
### load sports data set
#data(sports)
### FAST algorithm
#CR=FASTcons(sports,maxiter=10)
#####################################

#######################################
### load Emond and Mason data set
#data(EMD)
### matrix X contains rankings
#X=EMD[,1:15]
### vector Wk contains frequencies
#Wk=EMD[,16]
### QUICK algorithm
#CR=QuickCons(X,Wk)
#######################################




