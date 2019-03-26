library(lmomco)


### Name: lmomsRCmark
### Title: Sample L-moments Moments for Right-Tail Censoring by a Marking
###   Variable
### Aliases: lmomsRCmark
### Keywords: L-moment (sample) data censoring

### ** Examples

# Efron, B., 1988, Logistic regression, survival analysis, and the
# Kaplan-Meier curve: Journal of the American Statistical Association,
# v. 83, no. 402, pp.414--425
# Survival time measured in days for 51 patients with a marking
# variable in the "time,mark" ensemble. If marking variable is 1,
# then the time is right-censored by an unknown censoring threshold.
Efron <-
c(7,0,  34,0,  42,0,  63,0,  64,0,  74,1,  83,0,  84,0,  91,0,
108,0,  112,0,  129,0,  133,0,  133,0,  139,0,  140,0,  140,0,
146,0,  149,0,  154,0,  157,0,  160,0,  160,0,  165,0,  173,0,
176,0,  185,1,  218,0,  225,0,  241,0,  248,0,  273,0,  277,0,
279,1,  297,0,  319,1,  405,0,  417,0,  420,0,  440,0,  523,1,
523,0,  583,0,  594,0,  1101,0,  1116,1,  1146,0,  1226,1,
1349,1,  1412,1, 1417,1);

# Break up the ensembles into to vectors
ix <- seq(1,length(Efron),by=2)
T  <- Efron[ix]
Efron.data <- T;
Efron.rcmark <- Efron[(ix+1)]

lmr.RC <- lmomsRCmark(Efron.data, rcmark=Efron.rcmark)
lmr.ub <- lmoms(Efron.data)
lmr.noRC <- lmomsRCmark(Efron.data)
PP <- pp(Efron.data)
plot(PP, Efron.data, col=(Efron.rcmark+1), ylab="DATA")
lines(PP, qlmomco(PP, lmom2par(lmr.noRC, type="kap")), lwd=3, col=8)
lines(PP, qlmomco(PP, lmom2par(lmr.ub, type="kap")))
lines(PP, qlmomco(PP, lmom2par(lmr.RC, type="kap")), lwd=2, col=2)
legend(0,1000,c("uncensored L-moments by indicator (Kappa distribution)",
                "unbiased L-moments (Kappa)",
           "right-censored L-moments by indicator (Kappa distribution)"),
                lwd=c(3,1,2), col=c(8,1,2))

########
ZF <- 5 # discharge of undetection of streamflow
Q <- c(rep(ZF,8), 116, 34, 56, 78, 909, 12, 56, 45, 560, 300, 2500)
Qc <- Q == ZF; Qc <- as.numeric(Qc)
lmr     <- lmoms(Q)
lmr.cen <- lmomsRCmark(Q, rcmark=Qc, flip=TRUE)
flip <- lmr.cen$flip
fit  <- pargev(lmr);                     fit.cen <- pargev(lmr.cen)
F <- seq(0.001, 0.999, by=0.001)
Qfit     <-        qlmomco(    F, fit    )
Qfit.cen <- flip - qlmomco(1 - F, fit.cen) # remember to reverse qdf
plot(pp(Q),sort(Q), log="y", xlab="NONEXCEED PROB.", ylab="QUANTILE")
lines(F, Qfit);   lines(F, Qfit.cen,col=2)



