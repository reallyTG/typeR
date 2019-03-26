library(rPowerSampleSize)


### Name: indiv.rm.ssc
### Title: Sample size determination in the context of multiple continuous
###   endpoints with a control of the q-gFWER, for a given value of r-power
###   (generalized disjunctive power).
### Aliases: indiv.rm.ssc
### Keywords: package Bonferroni Procedure r power multiple testing sample
###   size computation

### ** Examples

## Not run: 
##D # Pneumovacs example (takes 37 mn to compute on 1 core)
##D 
##D # Treatment effect
##D delta <- c(0.55, 0.34, 0.38, 0.20, 0.70, 0.38, 0.86)
##D 
##D # Variances of the m endpoints
##D var <- c(0.3520, 0.6219, 0.5427, 0.6075, 0.6277,
##D 0.5527, 0.8066) ^ 2
##D 
##D # Covariance matrix
##D cov <- matrix(1, ncol = 7, nrow = 7)
##D cov[1, 2:7] <- cov[2:7, 1] <- c(0.1341692, 0.1373891, 0.07480123,
##D 0.1401267, 0.1280336, 0.1614103)
##D cov[2, 3:7] <- cov[3:7, 2] <- c(0.2874531, 0.18451960, 0.3156895,
##D 0.2954996, 0.3963837)
##D cov[3, 4:7] <- cov[4:7, 3] <- c(0.19903400, 0.2736123, 0.2369907, 0.3423579)
##D cov[4, 5:7] <- cov[5:7, 4] <- c(0.1915028, 0.1558958, 0.2376056)
##D cov[5, 6:7] <- cov[6:7, 5] <- c(0.2642217, 0.3969920)
##D cov[6, 7] <- cov[7, 6] <- 0.3352029
##D diag(cov) <- var
##D 
##D indiv.rm.ssc(method = "Hochberg", asympt = FALSE, r = 3, m = 7, p = 7, nCovernE = 1,
##D muC = NULL, muE = NULL, d = NULL, delta = delta, SigmaC = cov,
##D SigmaE = cov, power = 0.8, alpha = 0.05, interval = c(10, 2000), q = 1)
##D 
##D # Pre-RELAX-AHF example from the paper by Teerlink et al. (2009),
##D # Relaxin for the treatment of patients with acute heart failure
##D # (Pre-RELAX-AHF): a multicentre, randomised,
##D # placebo-controlled, parallel-group, dose-finding phase IIb
##D # study, Lancet, 373: 1429--39
##D 
##D # Table 2 page 1432:
##D # ------------------
##D # Proportion with moderately or markedly better dyspnoea at 6 h, 12 h, and 24 h (Likert): 23% 40%
##D # Dyspnoea AUC change from baseline to day 5 (VAS [mmxh]): 1679 (2556) 2567 (2898) 
##D # Worsening heart failure through day 5: 21% 12%
##D # Length of stay (days): 12.0 (7.3) 10.2 (6.1) 
##D # Days alive out of hospital: 44.2 (14.2) 47.9 (10.1) 
##D # KM cardiovascular death or readmission (HR, 95% CI): 17.2% 2.6% (0.13, 0.02--1.03); p=0.053 
##D # KM cardiovascular death (HR, 95% CI):  14.3% 0.0% (0.00, 0.00--0.98); p=0.046 
##D 
##D # Table 4 page 1436:
##D # ------------------
##D # >=25% increase at day 5: 8 (13%) 9 (21%) 
##D # >=26 micro-mol/L increase at days 5 and 14: 4 (7%)  3 (7%) 
##D muC <- c(23 / 100, 1679, 1 - 21 / 100, -12.0, 44.2, 1 - 17.2 / 100, 1 -
##D           14.3 / 100, 13 / 100, 7 / 100)
##D muE <- c(40 / 100, 2567, 1 - 12 / 100, -10.2, 47.9, 1 - 2.60 / 100, 1,
##D          21 / 100, 7 / 100)
##D 
##D sdC <- c(sqrt(0.23 * (1 - 0.23)), 2556, sqrt(0.79 * (1 - 0.79)), 7.3,
##D  14.2, sqrt(0.828 * (1 - 0.828)), sqrt(0.857 * (1 - 0.857)), sqrt(0.13 *
##D  (1 - 0.13)), sqrt(0.07 * (1 - 0.07)))
##D sdE <- c(sqrt(0.4 * (1 - 0.4))  , 2898, sqrt(0.88 * (1 - 0.88)), 6.1,
##D  10.1, sqrt(0.974 * (1 - 0.974)), 1e-12                    , sqrt(0.21 * (1 - 0.21)), 
##D  sqrt(0.07 * (1 - 0.07)))
##D 
##D m <- 9
##D rho <- 0.1
##D cor <- matrix(rho, nrow = m, ncol = m)
##D diag(cor) <- 1
##D sd.pooled <- sqrt(0.5 * sdE + 0.5 * sdC)
##D SigmaE <- diag(sdE) %*% cor %*% diag(sdE)
##D SigmaC <-diag(sdC) %*% cor %*% diag(sdC)
##D indiv.rm.ssc(method = "Bonferroni", asympt = FALSE, r = 6, m = 9, p = 9, nCovernE = 1,
##D   muC = NULL, muE = NULL, d = rep(0.0, m), delta = (muE - muC) / sd.pooled,
##D   SigmaC = cor, SigmaE = cor, power = 0.8, alpha = 0.1, interval = c(2, 500),
##D   q = 1, maxpts = 25000, abseps = 0.01, nbcores = 1, LB = TRUE)
##D 
## End(Not run)



