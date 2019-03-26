library(prevalence)


### Name: truePrevMulti
### Title: Estimate true prevalence from individuals samples using multiple
###   tests - conditional probability scheme
### Aliases: truePrevMulti

### ** Examples

## Not run: 
##D ## ===================================================== ##
##D ## 2-TEST EXAMPLE: Campylobacter                         ##
##D ## ----------------------------------------------------- ##
##D ## Two tests were performed on 656 chicken meat samples  ##
##D ## -> T1 = enrichment culture                            ##
##D ## -> T2 = direct plating                                ##
##D ## The following assumption were made:                   ##
##D ## -> TP is larger than 45% and smaller than 80%         ##
##D ## -> SE1 must lie within 24% and 50%                    ##
##D ## -> SP1 and SP2 both equal 100%                        ##
##D ## -> beta(30, 12) describes P(T2+|D+,T1+)               ##
##D ## The following results were obtained:                  ##
##D ## -> 113 samples T1+,T2+                                ##
##D ## ->  46 samples T1+,T2-                                ##
##D ## -> 156 samples T1-,T2+                                ##
##D ## -> 341 samples T1-,T2-                                ##
##D ## ===================================================== ##
##D 
##D ## how is the 2-test model defined?
##D define_x(2)
##D define_prior(2)
##D 
##D ## fit campylobacter 2-test model
##D campy <-
##D truePrevMulti(
##D   x = c(113, 46, 156, 341),
##D   n = 656,
##D   prior = {
##D     theta[1] ~ dunif(0.45, 0.80)
##D     theta[2] ~ dunif(0.24, 0.50)
##D     theta[3] <- 1
##D     theta[4] ~ dbeta(30, 12)
##D     theta[5] ~ dbeta(1, 1)
##D     theta[6] <- 1
##D     theta[7] <- 1
##D   }
##D )
##D 
##D ## fit same model using 'list-style'
##D campy <-
##D truePrevMulti(
##D   x = c(113, 46, 156, 341),
##D   n = 656,
##D   prior =
##D     list(
##D       theta1 = list(dist = "uniform", min = 0.45, max = 0.80),
##D       theta2 = list(dist = "uniform", min = 0.24, max = 0.50),
##D       theta3 = 1,
##D       theta4 = list(dist = "beta", alpha = 30, beta = 12),
##D       theta5 = list(dist = "beta", alpha = 1, beta = 1),
##D       theta6 = 1,
##D       theta7 = 1
##D     )
##D )
##D 
##D ## show model results
##D campy
##D 
##D ## explore model structure
##D str(campy)         # overall structure
##D str(campy@par)     # structure of slot 'par'
##D str(campy@mcmc)    # structure of slot 'mcmc'
##D campy@model        # fitted model
##D campy@diagnostics  # DIC, BGR and Bayes-P values
##D 
##D ## standard methods
##D print(campy)
##D summary(campy)
##D par(mfrow = c(2, 2))
##D plot(campy)         # shows plots of TP by default
##D plot(campy, "SE1")  # same plots for SE1
##D plot(campy, "SE2")  # same plots for SE2
##D 
##D ## coda plots of TP, SE1, SE2
##D par(mfrow = c(1, 3))
##D densplot(campy, col = "red")
##D traceplot(campy)
##D gelman.plot(campy)
##D autocorr.plot(campy)
##D 
##D 
##D ## ===================================================== ##
##D ## 3-TEST EXAMPLE: Giardia                               ##
##D ## ----------------------------------------------------- ##
##D ## Three tests were performed on stools from 272 dogs    ##
##D ## -> T1 = immunofluorescence assay                      ##
##D ## -> T2 = direct microscopy                             ##
##D ## -> T3 = SNAP immunochromatography                     ##
##D ## The following assumption were made:                   ##
##D ## -> TP is smaller than 20%                             ##
##D ## -> SE1 must be higher than 80%                        ##
##D ## -> SP1 must be higher than 90%                        ##
##D ## The following results were obtained:                  ##
##D ## ->   6 samples T1+,T2+,T3+                            ##
##D ## ->   4 samples T1+,T2+,T3-                            ##
##D ## ->  12 samples T1+,T2-,T3+                            ##
##D ## ->  12 samples T1+,T2-,T3-                            ##
##D ## ->   1 sample  T1-,T2+,T3+                            ##
##D ## ->  14 samples T1-,T2+,T3-                            ##
##D ## ->   3 samples T1-,T2-,T3+                            ##
##D ## -> 220 samples T1-,T2-,T3-                            ##
##D ## ===================================================== ##
##D 
##D ## how is the 3-test model defined?
##D define_x(3)
##D define_prior(3)
##D 
##D ## fit giardia 3-test model
##D giardia <-
##D truePrevMulti(
##D   x = c(6, 4, 12, 12, 1, 14, 3, 220),
##D   n = 272,
##D   prior = {
##D     theta[1] ~ dunif(0.00, 0.20)
##D     theta[2] ~ dunif(0.90, 1.00)
##D     theta[3] ~ dunif(0.80, 1.00)
##D     theta[4] ~ dbeta(1, 1)
##D     theta[5] ~ dbeta(1, 1)
##D     theta[6] ~ dbeta(1, 1)
##D     theta[7] ~ dbeta(1, 1)
##D     theta[8] ~ dbeta(1, 1)
##D     theta[9] ~ dbeta(1, 1)
##D     theta[10] ~ dbeta(1, 1)
##D     theta[11] ~ dbeta(1, 1)
##D     theta[12] ~ dbeta(1, 1)
##D     theta[13] ~ dbeta(1, 1)
##D     theta[14] ~ dbeta(1, 1)
##D     theta[15] ~ dbeta(1, 1)
##D   }
##D )
##D 
##D ## show model results
##D giardia
##D 
##D ## coda densplots
##D par(mfcol = c(2, 4))
##D densplot(giardia, col = "red")
## End(Not run)


