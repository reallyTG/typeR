library(apt)


### Name: daVich
### Title: Import prices and values of wooden beds from Vietnam and China
### Aliases: daVich
### Keywords: datasets

### ** Examples


# The following codes reproduce the main results in Sun (2011 FPE).
# All the codes have been tested and should work.

# 1. Data preparation __________________________________________________________

library(urca); data(daVich)
head(daVich); tail(daVich); str(daVich)
prVi <- y <- daVich[, 1] 
prCh <- x <- daVich[, 2]


# 2. EG cointegration  _________________________________________________________

LR <- lm(y ~ x); summary(LR)
(LR.coef <- round(summary(LR)$coefficients, 3))
(ry <-  ts(residuals(LR), start=start(prCh), end=end(prCh), frequency =12))
summary(eg <- ur.df(ry,  type=c("none"), lags=1)); plot(eg)
(eg4  <- Box.test(eg@res, lag = 4, type="Ljung") )
(eg8  <- Box.test(eg@res, lag = 8, type="Ljung") )
(eg12 <- Box.test(eg@res, lag = 12, type="Ljung"))


## Not run: 
##D 
##D # 3. TAR + Cointegration  ______________________________________________________
##D 
##D # best threshold 
##D t3 <- ciTarThd(y=prVi, x=prCh, model="tar", lag=0) 
##D (th.tar <- t3$basic); plot(t3)
##D for (i in 1:12) {                 # 20 seconds
##D   t3a <- ciTarThd(y=prVi, x=prCh, model="tar", lag=i) 
##D   th.tar[i+2] <- t3a$basic[,2]
##D }
##D th.tar
##D  
##D t4 <- ciTarThd(y=prVi, x=prCh, model="mtar", lag=0); (th.mtar <- t4$basic)
##D plot(t4)
##D for (i in 1:12) {
##D   t4a <- ciTarThd(y=prVi, x=prCh, model="mtar", lag=i) 
##D   th.mtar[i+2] <- t4a$basic[,2]
##D  }
##D th.mtar
##D 
##D # The following threshold values are specific to this data. They HAVE TO be  
##D # revised for another data set. Otherwise, various errors will occur.
##D   t.tar <- -8.041; t.mtar <- -0.451     # lag = 0 to 4
##D # t.tar <- -8.701 ; t.mtar <- -0.451    # lag = 5 to 12
##D 
##D # lag selection
##D mx <- 12
##D (g1 <-ciTarLag(y=prVi, x=prCh, model="tar", maxlag=mx, thresh= 0));     plot(g1)
##D (g2 <-ciTarLag(y=prVi, x=prCh, model="mtar",maxlag=mx, thresh= 0));     plot(g2)
##D (g3 <-ciTarLag(y=prVi, x=prCh, model="tar", maxlag=mx, thresh=t.tar));  plot(g3)
##D (g4 <-ciTarLag(y=prVi, x=prCh, model="mtar",maxlag=mx, thresh=t.mtar)); plot(g4)
##D 
##D 
##D # Table 3 Results of EG and threshold cointegration tests
##D # Note: Some results in Table 3 in the published paper were incorrect because
##D #  of a mistake made when the paper was done in 2009. I found the mistake when 
##D #  the package was build in later 2010. For example, for the consistent MTAR, 
##D #  the coefficient for the positive term was reported as -0.251 (-2.130) but 
##D #  it should be -0.106 (-0.764), as cacluated from below codes. 
##D #  The main conclusion about the research issue is still qualitatively the same.
##D vv <- 3
##D (f1 <- ciTarFit(y=prVi, x=prCh, model="tar",  lag=vv, thresh=0     ))
##D (f2 <- ciTarFit(y=prVi, x=prCh, model="tar",  lag=vv, thresh=t.tar ))
##D (f3 <- ciTarFit(y=prVi, x=prCh, model="mtar", lag=vv, thresh=0     ))
##D (f4 <- ciTarFit(y=prVi, x=prCh, model="mtar", lag=vv, thresh=t.mtar))
##D  
##D r0 <- cbind(summary(f1)$dia, summary(f2)$dia, summary(f3)$dia, 
##D   summary(f4)$dia)
##D diag <- r0[c(1:4, 6:7, 12:14, 8, 9, 11), c(1,2,4,6,8)]
##D rownames(diag) <- 1:nrow(diag); diag
##D 
##D e1 <- summary(f1)$out; e2 <- summary(f2)$out
##D e3 <- summary(f3)$out; e4 <- summary(f4)$out; rbind(e1, e2, e3, e4)
##D ee <- list(e1, e2, e3, e4); vect <- NULL
##D for (i in 1:4) {
##D   ef <- data.frame(ee[i])
##D   vect2 <- c(paste(ef[3, "estimate"], ef[3, "sign"], sep=""), 
##D              paste("(", ef[3, "t.value"], ")",       sep=""),
##D              paste(ef[4, "estimate"], ef[4, "sign"], sep=""), 
##D              paste("(", ef[4, "t.value"], ")",       sep=""))    
##D   vect <- cbind(vect, vect2)
##D }
##D item <- c("pos.coeff","pos.t.value", "neg.coeff","neg.t.value")
##D ve <- data.frame(cbind(item, vect)); colnames(ve) <- colnames(diag)
##D ( res.CI <- rbind(diag, ve)[c(1:2, 13:16, 3:12), ] )
##D rownames(res.CI) <- 1:nrow(res.CI)
##D 
##D                         
##D # 4. APT + ECM   _______________________________________________________________
##D 
##D (sem <- ecmSymFit(y=prVi, x=prCh, lag=4)); names(sem)
##D aem <- ecmAsyFit(y=prVi, x=prCh,lag=4, model="mtar", split=TRUE, thresh=t.mtar)
##D aem
##D (ccc <- summary(aem))
##D coe <- cbind(as.character(ccc[1:19, 2]), 
##D   paste(ccc[1:19, "estimate"], ccc$signif[1:19], sep=""), ccc[1:19, "t.value"],
##D   paste(ccc[20:38,"estimate"], ccc$signif[20:38],sep=""), ccc[20:38,"t.value"]) 
##D colnames(coe) <- c("item", "China.est", "China.t", "Vietnam.est","Vietnam.t")
##D 
##D (edia <- ecmDiag(aem, 3))
##D (ed <- edia[c(1,6,7,8,9), ])
##D ed2 <- cbind(ed[,1:2], "_", ed[,3], "_")
##D colnames(ed2) <- colnames(coe)
##D 
##D (tes <- ecmAsyTest(aem)$out)
##D (tes2 <- tes[c(2,3,5,11,12,13,1), -1])
##D tes3 <- cbind(as.character(tes2[,1]), 
##D   paste(tes2[,2], tes2[,6], sep=''), paste("[", round(tes2[,4],2), "]", sep=''),
##D   paste(tes2[,3], tes2[,7], sep=''), paste("[", round(tes2[,5],2), "]", sep=''))
##D colnames(tes3) <- colnames(coe)
##D 
##D (coe  <- data.frame(apply(coe, 2, as.character), stringsAsFactors=FALSE))
##D (ed2  <- data.frame(apply(ed2, 2, as.character), stringsAsFactors=FALSE))
##D (tes3 <- data.frame(apply(tes3,2, as.character), stringsAsFactors=FALSE))
##D table.4 <- data.frame(rbind(coe, ed2, tes3))
##D options(width=150); table.4; options(width=80)
##D 
## End(Not run) 



