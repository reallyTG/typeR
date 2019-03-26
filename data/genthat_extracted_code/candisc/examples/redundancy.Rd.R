library(candisc)


### Name: redundancy
### Title: Canonical Redundancy Analysis
### Aliases: redundancy print.cancor.redundancy
### Keywords: multivariate

### ** Examples

	data(Rohwer, package="heplots")
X <- as.matrix(Rohwer[,6:10])  # the PA tests
Y <- as.matrix(Rohwer[,3:5])   # the aptitude/ability variables

cc <- cancor(X, Y, set.names=c("PA", "Ability"))

redundancy(cc)
## 
## Redundancies for the PA variables & total X canonical redundancy
## 
##     Xcan1     Xcan2     Xcan3 total X|Y 
##   0.17342   0.04211   0.00797   0.22350 
## 
## Redundancies for the Ability variables & total Y canonical redundancy
## 
##     Ycan1     Ycan2     Ycan3 total Y|X 
##    0.2249    0.0369    0.0156    0.2774 




