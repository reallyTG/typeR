### R code from vignette source 'MiRKAT.Rnw'
### Encoding: CP936

###################################################
### code chunk number 1: data1
###################################################
library(MiRKAT, quietly=TRUE)
library(GUniFrac, quietly=TRUE)
data(throat.tree)
data(throat.otu.tab)
data(throat.meta)
attach(throat.meta)


###################################################
### code chunk number 2: data2
###################################################
set.seed(123)
Male = (Sex == "Male")**2
Smoker =(SmokingStatus == "Smoker") **2
anti =  (AntibioticUsePast3Months_TimeFromAntibioticUsage != "None")^2
cova = cbind(Male,  anti)
detach(throat.meta)


###################################################
### code chunk number 3: data3
###################################################
otu.tab.rff <- Rarefy(throat.otu.tab)$otu.tab.rff
unifracs <- GUniFrac(otu.tab.rff, throat.tree, alpha=c(0, 0.5, 1))$unifracs

D.weighted = unifracs[,,"d_1"]
D.unweighted = unifracs[,,"d_UW"]
D.generalized = unifracs[,,"d_0.5"]
D.BC= as.matrix(vegdist(otu.tab.rff , method="bray"))



###################################################
### code chunk number 4: data4
###################################################
K.weighted = D2K(D.weighted)
K.unweighted = D2K(D.unweighted)
K.generalized = D2K(D.generalized)
K.BC = D2K(D.BC)


###################################################
### code chunk number 5: data5
###################################################
MiRKAT(y = Smoker, Ks = K.weighted, X = cbind(Male, anti),
       out_type = "D", method = "davies")


###################################################
### code chunk number 6: data6
###################################################
Ks = list(K.weighted, K.unweighted, K.BC)
MiRKAT(y = Smoker, Ks = Ks, X = cbind(Male, anti),out_type = "D" ,
       nperm = 9999, method = "davies")


###################################################
### code chunk number 7: data7
###################################################
# Simulate outcomes 
# Here, outcome is associated with covariates but unassociated with microbiota
# 33% censoring 
SurvTime <- rexp(60, (1 + Smoker + Male))
CensTime <- rexp(60, 0.75)
Delta <- as.numeric( SurvTime <= CensTime )
ObsTime <- pmin(SurvTime, CensTime)


###################################################
### code chunk number 8: data10
###################################################
# use kernel matrix with distance=FALSE 
MiRKATS(kd = K.generalized, distance = FALSE, obstime = ObsTime,
        delta = Delta, covar = cbind(Male, Smoker))
# equivalently, use distance matrix with distance=TRUE 
MiRKATS(kd = D.generalized, distance = TRUE, obstime = ObsTime,
        delta = Delta, covar = cbind(Male, Smoker))
# Permutation version of the test
MiRKATS(kd = K.generalized, distance = FALSE, obstime = ObsTime,
        delta = Delta, covar = cbind(Male, Smoker), perm=TRUE, nperm=1000)


###################################################
### code chunk number 9: data15
###################################################
set.seed(123)
n = nrow(throat.otu.tab)
Y = matrix(rnorm(n * 3, 0, 1),n ,3)


###################################################
### code chunk number 10: data16
###################################################
MMiRKAT(Y = Y, K = K.weighted, X = cbind(Male, anti)) 


###################################################
### code chunk number 11: data19
###################################################
library(MASS)
set.seed(123)
rho = 0.2
Va = matrix(rep(rho, (2*n)^2), 2*n, 2*n)+diag(1-rho, 2*n)
G = mvrnorm(n, rep(0, 2*n), Va)


###################################################
### code chunk number 12: data20
###################################################
KRV(kernel.otu = K.weighted, kernel.y = G %*% t(G)) 


###################################################
### code chunk number 13: data21
###################################################
KRV(kernel.otu = K.weighted, y = G, X = cova, kernel.y = "linear") 


