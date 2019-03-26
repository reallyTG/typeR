library(EnergyOnlineCPM)


### Name: maxEnergyCPMv
### Title: Nonparametric Multivariate Control Chart based on Energy Test
### Aliases: maxEnergyCPMv
### Keywords: Phase II Statistical Process Control Change Point Model
###   Energy Statistic

### ** Examples


# simulate 300 length time series
simNr=300

# simulate 300 length 5 dimensonal standard Gaussian series
Sigma2 <- matrix(c(1,0,0,0,0,  0,1,0,0,0,   0,0,1,0,0,  0,0,0,1,0,  0,0,0,0,1),5,5)
Mean2=rep(1,5)
sim2=(mvrnorm(n = simNr, Mean2, Sigma2)) 

# simulate 300 length 5 dimensonal standard Gaussian series
Sigma3 <- matrix(c(1,0,0,0,0,  0,1,0,0,0,   0,0,1,0,0,  0,0,0,1,0,  0,0,0,0,1),5,5)
Mean3=rep(0,5)
sim3=(mvrnorm(n = simNr, Mean3, Sigma3))

# construct a data set of length equal to 35.
# first 20 points are from standard Gaussian. 
# second 15 points from a Gaussian with a mean shift with 555.
data1=sim6=rbind(sim2[1:20,],(sim3+555)[1:15,])

# set warm-up number as 20, permutation 200 times, significant level 0.005
wNr=20
permNr=200
alpha=1/200
maxEnergyCPMv(data1,wNr,permNr,alpha)




