library(Surrogate)


### Name: plot ICA.ContCont.MultS
### Title: Plots the Individual Causal Association in the setting where
###   there are multiple continuous S and a continuous T
### Aliases: plot.ICA.ContCont.MultS plot.ICA.ContCont.MultS_alt
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting Multiple-trial setting Sensitivity Multiple surrogates
###   Multivariate setting

### ** Examples

## Not run: 
##D  #time-consuming code parts
##D # Specify matrix Sigma (var-cavar matrix T_0, T_1, S1_0, S1_1, ...)
##D # here for 1 true endpoint and 3 surrogates
##D 
##D s<-matrix(rep(NA, times=64),8)
##D s[1,1] <- 450; s[2,2] <- 413.5; s[3,3] <- 174.2; s[4,4] <- 157.5; 
##D s[5,5] <- 244.0; s[6,6] <- 229.99; s[7,7] <- 294.2; s[8,8] <- 302.5
##D s[3,1] <- 160.8; s[5,1] <- 208.5; s[7,1] <- 268.4 
##D s[4,2] <- 124.6; s[6,2] <- 212.3; s[8,2] <- 287.1
##D s[5,3] <- 160.3; s[7,3] <- 142.8 
##D s[6,4] <- 134.3; s[8,4] <- 130.4 
##D s[7,5] <- 209.3; 
##D s[8,6] <- 214.7 
##D s[upper.tri(s)] = t(s)[upper.tri(s)]
##D 
##D # Marix looks like:
##D #            T_0    T_1  S1_0  S1_1  S2_0   S2_1  S2_0  S2_1
##D #            [,1]  [,2]  [,3]  [,4]  [,5]   [,6]  [,7]  [,8]
##D # T_0  [1,] 450.0    NA 160.8    NA 208.5     NA 268.4    NA
##D # T_1  [2,]    NA 413.5    NA 124.6    NA 212.30    NA 287.1
##D # S1_0 [3,] 160.8    NA 174.2    NA 160.3     NA 142.8    NA
##D # S1_1 [4,]    NA 124.6    NA 157.5    NA 134.30    NA 130.4
##D # S2_0 [5,] 208.5    NA 160.3    NA 244.0     NA 209.3    NA
##D # S2_1 [6,]    NA 212.3    NA 134.3    NA 229.99    NA 214.7
##D # S3_0 [7,] 268.4    NA 142.8    NA 209.3     NA 294.2    NA
##D # S3_1 [8,]    NA 287.1    NA 130.4    NA 214.70    NA 302.5
##D 
##D # Conduct analysis
##D ICA <- ICA.ContCont.MultS(M=100, N=200, Show.Progress = TRUE,
##D   Sigma=s, G = seq(from=-1, to=1, by = .00001), Seed=c(123), 
##D   Model = "Delta_T ~ Delta_S1 + Delta_S2 + Delta_S3")
##D 
##D # Explore results
##D summary(ICA)
##D plot(ICA)
## End(Not run)



