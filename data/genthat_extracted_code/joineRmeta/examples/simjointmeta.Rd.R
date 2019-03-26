library(joineRmeta)


### Name: simjointmeta
### Title: Simulation of multi-study joint data
### Aliases: simjointmeta

### ** Examples

 #simulated data without study level variation specified
 exampledat1<-simjointmeta(k = 5, n = rep(500, 5), sepassoc = FALSE,
              ntms = 5, longmeasuretimes = c(0, 1, 2, 3, 4),
              beta1 = c(1, 2, 3), beta2 = 1, rand_ind = 'intslope',
              rand_stud = NULL, gamma_ind = 1,
              sigb_ind = matrix(c(1,0.5,0.5,1.5),nrow=2), vare = 0.01,
              theta0 = -3, theta1 = 1, censoring = TRUE, censlam = exp(-3),
              truncation = FALSE, trunctime = max(longmeasuretimes))

 #simulated data with different parameters for each study for the
 #association parameters, censoring distribution parameters and survival time
 #parameters
 gamma_ind_set<-list(c(0.5, 1), c(0.4, 0.9), c(0.6, 1.1), c(0.5, 0.9),
                     c(0.4, 1.1))
 gamma_stud_set<-list(c(0.6, 1.1), c(0.5, 1), c(0.5, 0.9), c(0.4, 1.1),
                     c(0.4, 0.9))
 censlamset<-c(exp(-3), exp(-2.9), exp(-3.1), exp(-3), exp(-3.05))
 theta0set<-c(-3, -2.9, -3, -2.9, -3.1)
 theta1set<-c(1, 0.9, 1.1, 1, 0.9)

 exampledat2<-simjointmeta(k = 5, n = rep(500, 5), sepassoc = TRUE, ntms = 5,
                           longmeasuretimes = c(0, 1, 2, 3, 4),
                           beta1 = c(1, 2, 3), beta2 = 1,
                           rand_ind = 'intslope', rand_stud = 'inttreat',
                           gamma_ind = gamma_ind_set,
                           gamma_stud = gamma_stud_set,
                           sigb_ind = matrix(c(1, 0.5, 0.5, 1.5), nrow = 2),
                           sigb_stud = matrix(c(1, 0.5, 0.5, 1.5), nrow = 2),
                           vare = 0.01, theta0 = theta0set,
                           theta1 = theta1set, censoring = TRUE,
                           censlam = censlamset, truncation = FALSE,
                           trunctime = max(longmeasuretimes))





