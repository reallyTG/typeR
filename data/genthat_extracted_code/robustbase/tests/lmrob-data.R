### lmrob()  with "real data"

library(robustbase)

set.seed(0)
data(salinity)
summary(m0.sali  <- lmrob(Y ~ . , data = salinity))
(A1 <- anova(m0.sali, Y ~ X1 + X3))
## -> X2 is not needed
(m1.sali  <- lmrob(Y ~ X1 + X3, data = salinity))
(A2 <- anova(m0.sali, m1.sali)) # the same as before
stopifnot(all.equal(A1[2,"Pr(>chisq)"],
		    A2[2,"Pr(>chisq)"], tolerance=1e-14))
anova(m0.sali, m1.sali, test = "Deviance")
## whereas 'X3' is highly significant:
m2 <- update(m0.sali, ~ . -X3)
(A3 <- anova(m0.sali, m2))
(A4 <- anova(m0.sali, m2, test = "Deviance"))
cX3 <- c(Estimate = -0.627327396, `Std. Error` = 0.15844971,
         `t value` = -3.9591577, `Pr(>|t|)` = 0.000584156)
stopifnot(all.equal(cX3, coef(summary(m0.sali))["X3",], tolerance = 1e-6))


##  example(lmrob)
set.seed(7)
data(coleman)
summary( m1 <- lmrob(Y ~ ., data=coleman) )
stopifnot(c(3,18) == which(m1$w < 0.2))

if(FALSE) # to find out *why setting = "KS201x" fails
trace(lmrob.S, exit = quote({cat("coef:\n"); print(b$coefficients)}))
if(FALSE) # to find out via  setting = "KS201x" fails here in the *initial* estimate
debug(lmrob.S)

data(starsCYG)
  lmST <-    lm(log.light ~ log.Te, data = starsCYG)
(RlmST <- lmrob(log.light ~ log.Te, data = starsCYG, control=lmrob.control(trace = 1)))
summary(RlmST)
## Least Sq. w/ negative slope, where robust has slope ~= 2.2 :
stopifnot(coef(lmST)[["log.Te"]] < 0,
          all.equal(coef(RlmST), c("(Intercept)" = -4.969, log.Te=2.253), tol = 1e-3),
          c(11,20,30,34) == which(RlmST$w < 0.01))
## ==> Now see that  "KS2011" and "KS2014" both break down -- and it is the fault of "lqq" *only* :
(RlmST.11 <- update(RlmST, control = lmrob.control("KS2011",                             trace= 1)))
(RlmST.14 <- update(RlmST, control = lmrob.control("KS2014",                             trace= 1)))
(RlmSTM11 <- update(RlmST, control = lmrob.control("KS2011", method="MM",                trace= 1)))
(RlmSTM14 <- update(RlmST, control = lmrob.control("KS2014", method="MM",                trace= 1)))
## using "biweight" instead of "lqq"  fixes the problem :
(RlmSTbM11 <- update(RlmST,control = lmrob.control("KS2011", method="MM", psi="biweight",trace= 1)))
(RlmSTbM14 <- update(RlmST,control = lmrob.control("KS2014", method="MM", psi="biweight",trace= 1)))
(RlmSTb.11 <- update(RlmST,control = lmrob.control("KS2011",              psi="biweight",trace= 1)))
(RlmSTb.14 <- update(RlmST,control = lmrob.control("KS2014",              psi="biweight",trace= 1)))
## NB: RlmST has component 'init.S' the others have "init" -- documented in ?lmrob.fit == ../man/lmrob.fit.Rd
R.ini.cf <- t(sapply(mget(ls(patt = "^RlmST")), function(OB) OB$init$coef))
R..cf    <- t(sapply(mget(ls(patt = "^RlmST")), coef))
cbind(R.ini.cf, R..cf) ##---> "lqq" is *NOT* robust enough here -- but "biweight" is !!

options(digits = 5)# less platform dependence
## Directly look at init.S():
x.s <- model.matrix(~ log.Te, data = starsCYG)
y.s <- model.response(model.frame(log.light ~ log.Te, data = starsCYG))
ini.df <- lmrob.S(x.s, y.s, control=lmrob.control())
ini.11 <- lmrob.S(x.s, y.s, control=lmrob.control("KS2011"))
ini.14 <- lmrob.S(x.s, y.s, control=lmrob.control("KS2014"))
## but these are fine !! :
rbind(deflt = ini.df$coef,
      KS.11 = ini.11$coef,
      KS.14 = ini.14$coef)
##==> No, it is *not* the init.S()
ini.14$scale #  0.48144

## More clearly shows how M-estimate is converging to *WRONG* solution:
(RlmST.lqq <- update(RlmST, init=ini.14, control = lmrob.control(method="MM", psi="lqq", trace= 4)))
## --> break down
## The 10 largest residuals from the robust init. S-estim:
(i10 <- head(order(abs(residuals(ini.14)), decreasing=TRUE), 10))
residuals(ini.14)[i10]
## ==> and their weights for the different  psi() and their default (95% efficiency) tuning:
PSIs <- names(.Mchi.tuning.defaults)
sapply(PSIs, function(PSI)
    Mwgt(residuals(ini.14)[i10], cc = .Mpsi.tuning.defaults[[PSI]], psi=PSI))
## All MM:
RlmST.MM <- lapply(setNames(,PSIs), function(PSI)
    update(RlmST, init=ini.14, control = lmrob.control(method="MM", psi = PSI)))
cf.MM <- t(sapply(RlmST.MM, coef))
cf.MM[order(cf.MM[,1], cf.MM[,2]),] ## only 'bisquare' and 'optimal' are robust enough



##=== Werner's analysis: Sensitivity curves for the most-left obs  =========================================
dd <- starsCYG
dd <- dd[order(dd[,"log.Te"]),] # ==> leverage points come first (and easier plotting)
(rr <- lmrob(log.light ~ log.Te, data = dd))
(rr14 <- update(rr, control = lmrob.control("KS2014")))

dd[1,2] # 6.05  will be replaced for sensitivity curve

leg.s <- c("default, biweight"
           ,"KS14, lqq"
           ,"KS14, biweight"
           ,"KS14, optimal"
           ,"KS14, Hampel"
           ,"KS14, GGW"
           ,"KS14, Welsh"
           )
nEst <- length(leg.s) # == number of estimators used below
nn <- length(y1 <- c(NA, seq(2,9, length=64)))
nCf <- length(coef(rr)) + 1 # +1: sigma
r.coef <- matrix(NA, length(y1), nEst*nCf)
t.d <- dd
oo <- options(warn = 1)
## vary the left-most observation and fit all three
for (i in seq_along(y1)) {
  cat(sprintf("%3d: %11.6g -- ", i, y1[i]))
  t.d[1,2] <- y1[i]
  ## the (old) default does not converge in 4 cases
  lr    <- update(rr,   data=t.d, control = lmrob.control(maxit=500))                 ; cat("1")
  lr14  <- update(rr14, data=t.d, control = lmrob.control("KS2014", psi="lqq") )      ; cat("2")
  lr14b <- update(rr14, data=t.d, control = lmrob.control("KS2014", psi="biweight") ) ; cat("3")
  lr14o <- update(rr14, data=t.d, control = lmrob.control("KS2014", psi="optimal" ) ) ; cat("4")
  lr14h <- update(rr14, data=t.d, control = lmrob.control("KS2014", psi="hampel"  ) ) ; cat("5")
  lr14g <- update(rr14, data=t.d, control = lmrob.control("KS2014", psi="ggw"     ) ) ; cat("6")
  lr14a <- update(rr14, data=t.d, control = lmrob.control("KS2014", psi="welsh"   ) ) ; cat("7")
  r.coef[i,] <- c(coef(lr   ), sigma(lr),
                  coef(lr14 ), sigma(lr14),
                  coef(lr14b), sigma(lr14b),
                  coef(lr14o), sigma(lr14o),
                  coef(lr14h), sigma(lr14h),
                  coef(lr14g), sigma(lr14g),
                  coef(lr14a), sigma(lr14a))
  cat("\n")
}
options(oo)

## cbind(y=y.1, r.coef)
## y1[1] = where the NA is
pMat <- function(j, main, x.legend, col = 1:8, lty=1:6, lwd = 2, ylab=NA, ...) {
    stopifnot(j %in% seq_len(ncol(r.coef)))
    matplot(y1, r.coef[, j], type="l", xlab = quote("varying obs." ~ ~ y[1]),
            ylab=ylab, main=main, col=col, lty=lty, lwd=lwd, ...)
    xx <- par("usr")[1:2]; yL <- .99* xx[1] + .01*xx[2]
    matpoints(yL, r.coef[1, j, drop=FALSE], pch = 20, col=col, lwd=lwd)
    abline(h =    r.coef[1, j, drop=FALSE], col = col, lwd=1, lty=3)
    legend(x.legend, leg.s, lty=lty, col=col, lwd=lwd, bty = "n")
    abline(v = dd[1,2], col=adjustcolor("tomato", 1/4)) # true y value
}

(jj0 <- nCf*(seq_len(nEst)-1L))
sfsmisc::mult.fig(2)$old.par -> op
pMat(j = 2+jj0, main = quote("slope" ~~ hat(beta[2])), "bottomleft")
pMat(j = 3+jj0, main = quote(hat(sigma)), "topleft")
par(op)
## --------------------------------

set.seed(47)
data(hbk)
m.hbk <- lmrob(Y ~ ., data = hbk)
summary(m.hbk)
stopifnot(1:10 == which(m.hbk$w < 0.01))

data(heart)
summary(mhrt <- lmrob(clength ~ ., data = heart)) # -> warning 'maxit.scale=200' too small
stopifnot(8  == which(mhrt$w < 0.15),
          11 == which(0.61 < mhrt$w & mhrt$w < 0.62),
          c(1:7,9:10,12) == which(mhrt$w > 0.90))

iN <- c(3,5,7,11)
heartN <- heart; heartN[iN, "clength"] <- NA
lmN <- lm   (clength ~ ., data = heartN) # default na.action=na.omit
mhN <- lmrob(clength ~ ., data = heartN) # default na.action=na.omit
 # ==> everything just uses the n=8 complete obs
summary(mhN) # now *does* note the 4 omitted obs.
mhNex <- lmrob(clength ~ ., data = heartN, na.action=na.exclude)
summary(mhNex)
mhNx1 <- update(mhNex, ~ . - weight)
mhNx0 <- update(mhNex, ~ 1)
stopifnot(
    length(r.mNex <- resid(mhNex)) == nrow(heartN)
   ,
    iN == which(iNAr <- is.na(r.mNex))
   ,
    identical(iNAr, is.na(r.mN1 <- residuals(mhNx1)))
   ,
    identical(iNAr, is.na(r.mN0 <- residuals(mhNx0)))
)

data(stackloss)
mSL <- lmrob(stack.loss ~ ., data = stackloss)
summary(mSL)


cat('Time elapsed: ', proc.time(),'\n') # "stats"
