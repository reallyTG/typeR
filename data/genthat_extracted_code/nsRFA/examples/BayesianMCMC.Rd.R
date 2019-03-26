library(nsRFA)


### Name: BayesianMCMC
### Title: Bayesian MCMC frequency analysis
### Aliases: BayesianMCMC BayesianMCMCcont BayesianMCMCreg
###   BayesianMCMCregcont plotBayesianMCMCreg_surf print.BayesianMCMC
###   plot.BayesianMCMC print.BayesianMCMCreg plot.BayesianMCMCreg
### Keywords: htest

### ** Examples

set.seed(2988)
serie <- rand.GEV(120, xi=40, alfa=20, k=-0.4)
serie100 <- serie[1:100]
serie100[serie100 < 250] <- NA
serie20 <- serie[101:120]
serie <- c(serie100, serie20)


plot(serie, type="h", ylim=c(0, 600), xlab="", 
     ylab="Annual flood peaks [m3/s]", lwd=3)
abline(h=0)
points(serie100, col=2)


## Not run: 
##D # Using only sistematic data
##D only_sist <- BayesianMCMC (xcont=serie20, nbpas=5000, nbchaines=3, varparameters0=c(70, 20, 0.5), 
##D                            confint=c(0.05, 0.95), dist="GEV")
##D plot(only_sist, which=c(1:3), ask=TRUE, ylim=c(1,600))
##D only_sist <- BayesianMCMCcont(only_sist)
##D plot(only_sist, which=c(1:3), ask=TRUE, ylim=c(1,600))
##D only_sist <- BayesianMCMCcont(only_sist)
##D plot(only_sist, which=c(1:3), ask=TRUE, ylim=c(1,600))
##D 
##D 
##D 
##D # Adding the information that the threshold 250 m3/s was exceeded 
##D #   3 times in the past 100 years
##D with_hist_thresh <- BayesianMCMC (xcont=serie20, infhist=rep(250,3), 
##D                                   nbans=100, seuil=250,
##D                                   nbpas=5000, nbchaines=3, 
##D                                   confint=c(0.05, 0.95), dist="GEV")
##D plot(with_hist_thresh, which=c(1:3), ask=TRUE, ylim=c(1,600))
##D 
##D 
##D 
##D # Assuming that the 3 historical events are known with high uncertainty
##D with_hist_limits <- BayesianMCMC (xcont=serie20,  
##D                                   infhist=c(320,320,250), 
##D                                   suphist=c(360,400,270), 
##D                                   nbans=100, seuil=250,
##D                                   nbpas=5000, nbchaines=3, 
##D                                   confint=c(0.05, 0.95), dist="GEV")
##D plot(with_hist_limits, which=c(1:3), ask=TRUE, ylim=c(1,600))
##D 
##D 
##D 
##D # Assuming that the 3 historical events are perfectly known
##D with_hist_known <- BayesianMCMC (xcont=serie20, xhist=serie100[!is.na(serie100)], 
##D                                  nbans=100, seuil=250,
##D                                  nbpas=5000, nbchaines=3, 
##D                                  confint=c(0.05, 0.95), dist="GEV")
##D plot(with_hist_known, which=c(1:3), ask=TRUE, ylim=c(1,600))
##D 
##D 
##D 
##D 
##D # Perception threshold without available information on floods
##D without_info <- BayesianMCMC (xcont=serie20, xhist=-1, 
##D                                  nbans=100, seuil=2400,
##D                                  nbpas=5000, nbchaines=3, 
##D                                  confint=c(0.05, 0.95), dist="GEV")
##D plot(without_info, which=c(1:3), ask=TRUE, ylim=c(1,600))
##D 
##D 
##D 
##D 
##D # Using one reasonable a-priori distribution
##D fNORM3 <- function (x) {
##D  # x = vector of values
##D  # mu = vector of means
##D  mu = c(44, 26, -0.40)
##D  # CM = covariance matrix
##D  CM = matrix(c(13, 7.8, -0.055,
##D                7.8, 15, -0.42,
##D                -0.055, -0.42, 0.056), nrow=3, ncol=3)
##D  CMm1 <- solve(CM)
##D  term2 <- exp(-((x - mu) %*% CMm1 %*% (x - mu))/2)
##D  term1 <- 1/(2*pi)^(3/2)/sqrt(det(CM))
##D  term1*term2
##D }
##D 
##D with_hist_known2 <- BayesianMCMC (xcont=serie20, xhist=serie100[!is.na(serie100)], 
##D                                   nbans=100, seuil=250,
##D                                   nbpas=5000, nbchaines=3, apriori=fNORM3,
##D                                   confint=c(0.05, 0.95), dist="GEV")
##D plot(with_hist_known2, 5)
##D plot(with_hist_known2, 4)
##D plot(with_hist_known, 4)
##D plot(with_hist_known)
##D plot(with_hist_known2)
##D 
##D 
##D 
##D # Using one non-reasonable a-priori distribution
##D fNORM3 <- function (x) {
##D  # x = vector of values
##D  # mu = vector of means
##D  mu = c(30, 50, -0.10)
##D  # CM = covariance matrix
##D  CM = matrix(c(13, 7.8, -0.055,
##D                7.8, 15, -0.42,
##D                -0.055, -0.42, 0.056), nrow=3, ncol=3)
##D  CMm1 <- solve(CM)
##D  term2 <- exp(-((x - mu) %*% CMm1 %*% (x - mu))/2)
##D  term2
##D }
##D 
##D with_hist_known3 <- BayesianMCMC (xcont=serie20, xhist=serie100[!is.na(serie100)], 
##D                                   nbans=100, seuil=250,
##D                                   nbpas=5000, nbchaines=3, apriori=fNORM3,
##D                                   confint=c(0.05, 0.95), dist="GEV")
##D plot(with_hist_known3, 5)
##D plot(with_hist_known3, 4)
##D plot(with_hist_known, 4)
##D plot(with_hist_known)
##D plot(with_hist_known3)
## End(Not run)

## Not run: 
##D # Assuming that the historical events are perfectly known and there are 4 different thresholds 
##D # The data file is presenting this way: 
##D 
##D # xhist nbans seuil 
##D #  6000    55  6000 
##D #  7400    28  7250 
##D #  6350     8  3050 
##D #  4000     0  3050 
##D #  4550     0  3050 
##D #  3950     0  3050 
##D #  7550    58  2400 
##D #  4650     0  2400 
##D #  3950     0  2400 
##D 
##D ## Warning: nbans and seuil should have the same length as xhist. 
##D 
##D # So when a threshold is exceeded several times, replicate it as many times it is exceeded 
##D # and part the number of years of exceedance into the number of times of exceedance 
##D # (the way you part the nbans vector is not important, what is important is that you have 
##D # length(nbans)=length(xhist) and the total of years for one same threshold equals the number 
##D # of years covered by the perception threshold) 
##D xhist_thres <- c(6000, 7400, 6350, 4000, 4550, 3950, 7550, 4650, 3950) 
##D seuil_thres <- c(6000, 7250, rep(3050, 4), rep(2400, 3)) 
##D nbans_thres <- c(55, 28, 8, 0, 0, 0, 58, 0, 0) 
##D 
##D # The threshold at 6000 has been exceeded for 55 years, the one at 7250 for 28 years, 
##D # the one at 3050 for 8 years and the one at 2400 for 58 years 
##D with_hist_known_several_thresholds <- BayesianMCMC (xcont=serie20, 
##D                                                     xhist=xhist_thres, 
##D                                                     nbans=nbans_thres, seuil=seuil_thres, 
##D                                                     nbpas=5000, nbchaines=3, 
##D                                                     confint=c(0.05, 0.95), dist="GEV", 
##D                                                     varparameters0=c(NA, NA, 0.5)) 
##D plot(with_hist_known_several_thresholds, which=c(1:3), ask=TRUE)
##D 
##D 
##D ## REGIONAL:
##D # Regional analysis, assuming that the 3 historical events are perfectly known and 
##D # there are 2 perception thresholds
##D regional_with_hist_known <- BayesianMCMCreg (xcont=serie20, 
##D                                              scont=c(rep(507,9),rep(2240,11)), 
##D                                              xhist=serie100[!is.na(serie100)],
##D 				             shist=c(495, 495, 87), 
##D                                              nbans=c(100, 0, 50), seuil=c(312, 312, 221),
##D                                              nbpas=5000, nbchaines=3, 
##D                                              confint=c(0.05, 0.95), dist="GEV", 
##D                                              varparameters0=c(NA, NA, NA, 0.5))
##D plot(regional_with_hist_known, which=1:3, ask=TRUE, ylim=c(1,600))
##D 
##D surf=c(571, 2240)
##D plotBayesianMCMCreg_surf(regional_with_hist_known, surf)
## End(Not run)



