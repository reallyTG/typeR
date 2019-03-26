### R code from vignette source 'BoolFilter.Rnw'

###################################################
### code chunk number 1: BoolFilter.Rnw:216-217
###################################################
library('BoolFilter')


###################################################
### code chunk number 2: BoolFilter.Rnw:249-250 (eval = FALSE)
###################################################
## p53net <- loadNetwork('p53.txt')


###################################################
### code chunk number 3: BoolFilter.Rnw:256-258 (eval = FALSE)
###################################################
## data(p53net_DNAdsb1) #DNA_dsb is ON
## data(p53net_DNAdsb0) #DNA_dsb is OFF


###################################################
### code chunk number 4: BoolFilter.Rnw:279-282 (eval = FALSE)
###################################################
## data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = .02,
##                       obsModel = list(type = 'Bernoulli', 
##                                       q = 0.05))


###################################################
### code chunk number 5: BoolFilter.Rnw:285-290 (eval = FALSE)
###################################################
## #View both datasets overlayed
## plotTrajectory(data$X, 
##                labels = p53net_DNAdsb1$genes, 
##                dataset2 = data$Y, 
##                compare = TRUE)


###################################################
### code chunk number 6: BoolFilter.Rnw:308-314 (eval = FALSE)
###################################################
## data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = 0.02,
##                       obsModel = list(type = 'Gaussian',
##                                       model = c(mu0 = 1, 
##                                              sigma0 = 2, 
##                                                 mu1 = 5, 
##                                             sigma1 = 2)))


###################################################
### code chunk number 7: BoolFilter.Rnw:334-337 (eval = FALSE)
###################################################
## obsModel <- list(type = 'Poisson', s = 10.75, mu = 0.01, delta = c(2, 2, 2, 2))
## 
## data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = 0.02, obsModel)


###################################################
### code chunk number 8: BoolFilter.Rnw:359-366 (eval = FALSE)
###################################################
## obsModel <- list(type = 'NB', 
##                     s = 10.875, 
##                     mu = 0.01, 
##                  delta = c(3, 3, 3, 3), 
##                    phi = c(2, 2, 2, 2))
## 
## data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = 0.02, obsModel)


###################################################
### code chunk number 9: BoolFilter.Rnw:369-371 (eval = FALSE)
###################################################
## #display data without observation noise
## plotTrajectory(data$X, labels = p53net_DNAdsb1$genes)


###################################################
### code chunk number 10: BoolFilter.Rnw:385-389 (eval = FALSE)
###################################################
## #simulate bernoulli noise on p53 network
## data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = .02,
##                       obsModel = list(type = 'Bernoulli', 
##                                       q = 0.02))


###################################################
### code chunk number 11: BoolFilter.Rnw:392-396 (eval = FALSE)
###################################################
## #run BKF algorithm on simulated data
## Results <- BKF(data$Y, p53net_DNAdsb1, p=0.02,
##                        obsModel = list(type = 'Bernoulli', 
##                                       q = 0.02))


###################################################
### code chunk number 12: BoolFilter.Rnw:400-405 (eval = FALSE)
###################################################
## #plot the original and estimated trajectories on top of each other.
## plotTrajectory(data$X, 
##                labels = p53net_DNAdsb1$genes, 
##                dataset2 = Results$Xhat, 
##                compare = TRUE)


###################################################
### code chunk number 13: BoolFilter.Rnw:414-421 (eval = FALSE)
###################################################
## data <- simulateNetwork(p53net_DNAdsb1, n.data = 100, p = 0.02,
##                       obsModel = list(type = 'Bernoulli',
##                                          q = 0.05))
## 
## Results <- BKS(data$Y, p53net_DNAdsb1, p = 0.02,
##                       obsModel = list(type = 'Bernoulli',
##                                          q = 0.05))


###################################################
### code chunk number 14: BoolFilter.Rnw:433-441 (eval = FALSE)
###################################################
## data(cellcycle)
## 
## data <- simulateNetwork(cellcycle, n.data = 100, p = 0.02,
##                       obsModel = list(type = 'Gaussian',
##                                       model = c(mu0 = 1, 
##                                              sigma0 = 2, 
##                                                 mu1 = 5, 
##                                              sigma1 = 2)))


###################################################
### code chunk number 15: BoolFilter.Rnw:446-452 (eval = FALSE)
###################################################
## Results <- SIR_BKF(data$Y, N = 1000, alpha = 0.9, cellcycle, p = 0.02, 
##                          obsModel = list(type = 'Gaussian',
##                                       model = c(mu0 = 1, 
##                                              sigma0 = 2, 
##                                                 mu1 = 5, 
##                                              sigma1 = 2)))


###################################################
### code chunk number 16: BoolFilter.Rnw:457-463 (eval = FALSE)
###################################################
## #compare the estimated and original state trajectories for selected Boolean variables
## VarPlot=c(1,2,5,7)
## plotTrajectory(data$X[VarPlot,], 
##                labels = cellcycle$genes[VarPlot], 
##                dataset2 = Results$Xhat[VarPlot,], 
##                compare = TRUE)


###################################################
### code chunk number 17: BoolFilter.Rnw:495-501 (eval = FALSE)
###################################################
## #load potential networks
## data(p53net_DNAdsb0)
## data(p53net_DNAdsb1)
## 
## net1 <- p53net_DNAdsb0
## net2 <- p53net_DNAdsb1


###################################################
### code chunk number 18: BoolFilter.Rnw:505-514 (eval = FALSE)
###################################################
## #define observation model
## observation = list(type = 'NB', 
##                       s = 10.875, 
##                      mu = 0.01, 
##                   delta = c(2, 2, 2, 2), 
##                     phi = c(3, 3, 3, 3))
## 
## #simulate data using one of the networks and a given 'p'
## data <- simulateNetwork(net1, n.data = 100, p = 0.02, obsModel = observation)


###################################################
### code chunk number 19: BoolFilter.Rnw:517-521 (eval = FALSE)
###################################################
## #run MMAE to determine model selection and parameter estimation
## MMAE(data$Y, net = c("net1","net2"), p = c(0.02,0.1,0.15), threshold = 0.8, 
##                                                     Prior = NA,
##                                                     obsModel = observation)


