library(GB2)


### Name: Varest
### Title: Variance Estimation of the Parameters of the GB2 Distribution
### Aliases: Varest varscore.gb2 vepar.gb2 derivind.gb2 veind.gb2
### Keywords: distribution

### ** Examples

# An example of variance estimation of the GB2 parameters,
# using the dataset "eusilcP" from the R package simFrame.
# Takes long time to run

## Not run: 
##D library(survey)
##D library(simFrame)
##D data(eusilcP)
##D 
##D # Draw a sample from eusilcP
##D # 1-stage simple random cluster sampling of size 6000 (cluster = household)
##D # directly,
##D #s <- draw(eusilcP[, c("hid", "hsize", "eqIncome")], grouping = "hid", size = 6000)
##D 
##D # or setting up 250 samples, and drawing the first one.
##D # This sample setup can be used for running a simulation.
##D set.seed(12345)
##D scs <- setup(eusilcP, grouping = "hid", size = 6000, k = 250)
##D s <- draw(eusilcP[, c("region", "hid", "hsize", "eqIncome")], scs, i=1)
##D 
##D # The number of observations (persons) in eusilcP (58654 persons)
##D \dontrun{N <- dim(eusilcP)[1]} 
##D # The number of households in eusilcP (25000 households)
##D Nh <- length(unique(eusilcP$hid)) 
##D 
##D # Survey design corresponding to the drawn sample
##D sdo = svydesign(id=~hid, fpc=rep(Nh,nrow(s)), data=s)
##D \dontrun{summary(sdo)}
##D 
##D # Truncated sample (truncate at 0)
##D s <- s[!is.na(s$eqIncome),] 
##D str <- s[s$eqIncome > 0, ]
##D eqInc <- str$eqIncome
##D w <- str$.weight            
##D 
##D # Designs for the truncated sample
##D sdotr <- subset(sdo, eqIncome >0)
##D sddtr = svydesign(id=~hid, strata=~region, fpc=NULL, weights=~.weight, data=str)
##D \dontrun{summary(sdotr)}
##D \dontrun{summary(sddtr)}
##D 
##D # Fit by maximum likelihood
##D fit <- ml.gb2(eqInc,w)$opt1
##D af <- fit$par[1]
##D bf <- fit$par[2]
##D pf <- fit$par[3]
##D qf <- fit$par[4]
##D mlik <- -fit$value
##D 
##D # Estimated parameters and indicators, empirical indicators 
##D gb2.par <- round(c(af, bf, pf, qf), digits=3)
##D emp.ind <- main.emp(eqInc, w)
##D gb2.ind <- main.gb2(0.6, af, bf, pf, qf)
##D 
##D # Scores
##D scores <- matrix(nrow=length(eqInc), ncol=4)
##D for (i in 1:length(eqInc)){
##D scores[i,] <- dlogf.gb2(eqInc[i], af, bf, pf, qf)
##D }
##D 
##D # Data on households only
##D sh <- unique(str)
##D heqInc <- sh$eqIncome
##D hw <- sh$.weight
##D hhs <- sh$hsize 
##D hs <- as.numeric(as.vector(hhs))  
##D 
##D # Variance of the scores
##D VSC <- varscore.gb2(heqInc, af, bf, pf, qf, hw, hs)
##D 
##D # Variance of the scores using the explicit designs, and package survey
##D DV1 <- vcov(svytotal(~scores[,1]+scores[,2]+scores[,3]+scores[,4], design=sdotr))
##D DV2 <- vcov(svytotal(~scores[,1]+scores[,2]+scores[,3]+scores[,4], design=sddtr))
##D 
##D # Estimated variance-covariance matrix of the parameters af, bf, pf and qf 
##D VCMP <- vepar.gb2(heqInc, VSC, af, bf, pf, qf, hw, hs)[[1]]
##D DVCMP1 <- vepar.gb2(heqInc, DV1, af, bf, pf, qf, hw, hs)[[1]]
##D DVCMP2 <- vepar.gb2(heqInc, DV2, af, bf, pf, qf, hw, hs)[[1]]
##D 
##D \dontrun{diag(DVCMP1)/diag(VCMP)}
##D \dontrun{diag(DVCMP2)/diag(VCMP)}
##D \dontrun{diag(DV1)/diag(VSC)}
##D \dontrun{diag(DV2)/diag(VSC)}
##D 
##D # Standard errors of af, bf, pf and qf
##D se.par <- sqrt(diag(VCMP))
##D sed1.par <- sqrt(diag(DVCMP1))
##D sed2.par <- sqrt(diag(DVCMP2))
##D 
##D # Estimated variance-covariance matrix of the indicators (VCMI)
##D VCMI <- veind.gb2(VCMP, af, bf, pf, qf) 
##D DVCMI1 <- veind.gb2(DVCMP1, af, bf, pf, qf)
##D DVCMI2 <- veind.gb2(DVCMP2, af, bf, pf, qf)
##D 
##D # Standard errors and confidence intervals
##D varest.ind <- diag(VCMI)
##D se.ind <- sqrt(varest.ind)
##D lci.ind <- gb2.ind - 1.96*se.ind
##D uci.ind <- gb2.ind + 1.96*se.ind
##D inCI <- as.numeric(lci.ind <= emp.ind & emp.ind <= uci.ind)
##D 
##D # under the sampling design sdotr
##D 
##D varestd1.ind <- diag(DVCMI1)
##D sed1.ind <- sqrt(varestd1.ind)
##D lcid1.ind <- gb2.ind - 1.96*sed1.ind
##D ucid1.ind <- gb2.ind + 1.96*sed1.ind
##D inCId1 <- as.numeric(lcid1.ind <= emp.ind & emp.ind <= ucid1.ind)
##D 
##D #under the sampling design sddtr
##D 
##D varestd2.ind <- diag(DVCMI2)
##D sed2.ind <- sqrt(varestd2.ind)
##D lcid2.ind <- gb2.ind - 1.96*sed2.ind
##D ucid2.ind <- gb2.ind + 1.96*sed2.ind
##D inCId2 <- as.numeric(lcid2.ind <= emp.ind & emp.ind <= ucid2.ind)
##D 
##D #coefficients of variation .par (parameters), .ind (indicators)
##D cv.par <- se.par/gb2.par
##D names(cv.par) <- c("am","bm","pm","qm")
##D cvd1.par <- sed1.par/gb2.par
##D names(cvd1.par) <- c("am","bm","pm","qm")
##D cvd2.par <- sed2.par/gb2.par
##D names(cvd2.par) <- c("am","bm","pm","qm")
##D 
##D cv.ind <- se.ind/gb2.ind
##D cvd1.ind <- sed1.ind/gb2.ind
##D cvd2.ind <- sed2.ind/gb2.ind
##D 
##D 
##D #results 
##D res <- data.frame(am = af, bm = bf, pm = pf, qm = qf, lik = mlik,
##D   median = gb2.ind[[1]], mean = gb2.ind[[2]], ARPR = gb2.ind[[3]], 
##D     RMPG = gb2.ind[[4]], QSR = gb2.ind[[5]], Gini = gb2.ind[[6]],
##D   emedian = emp.ind[[1]], emean = emp.ind[[2]], eARPR = emp.ind[[3]], 
##D     eRMPG = emp.ind[[4]], eQSR = emp.ind[[5]], eGini = emp.ind[[6]],
##D   cva = cv.par[1], cvb = cv.par[2], cvp= cv.par[3], cvq = cv.par[4],
##D   cvd1a = cvd1.par[1], cvd1b = cvd1.par[2], cvd1p= cvd1.par[3], cvd1q = cvd1.par[4],
##D   cvd2a = cvd2.par[1], cvd2b = cvd2.par[2], cvd2p= cvd2.par[3], cvd2q = cvd2.par[4],
##D   cvmed = cv.ind[[1]], cvmean = cv.ind[[2]], cvARPR = cv.ind[[3]], 
##D   cvRMPG = cv.ind[[4]], cvQSR = cv.ind[[5]], cvGini = cv.ind[[6]],
##D   cvd1med = cvd1.ind[[1]], cvd1mean = cvd1.ind[[2]], cvd1ARPR = cvd1.ind[[3]], 
##D   cvd1RMPG = cvd1.ind[[4]], cvd1QSR = cvd1.ind[[5]], cvd1Gini = cvd1.ind[[6]],
##D   cvd2med = cvd2.ind[[1]], cvd2mean = cvd2.ind[[2]], cvd2ARPR = cvd2.ind[[3]], 
##D   cvd2RMPG = cvd2.ind[[4]], cvd2QSR = cvd2.ind[[5]], cvd2Gini = cvd2.ind[[6]])
##D 
##D   res <- list(parameters = data.frame(am = af, bm = bf, pm = pf, qm = qf, lik = mlik),
##D               cv.parameters.naive = cv.par,
##D               cv.parameters.design1 = cvd1.par,
##D               cv.parameters.design2 = cvd2.par,
##D 		  GB2.indicators = gb2.ind,
##D               emp.indicators = emp.ind,
##D               cv.indicators.naive = cv.ind,
##D               cv.indicators.design1 = cvd1.ind,
##D               cv.indicators.design2 = cvd2.ind)
##D res
##D \dontrun{inCI}
## End(Not run)



