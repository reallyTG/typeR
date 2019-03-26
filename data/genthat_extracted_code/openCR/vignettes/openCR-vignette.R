## ----settings, echo = FALSE----------------------------------------------
mycache <- FALSE

## ----setup, message = FALSE, eval = TRUE, warning = FALSE-------------------------------
library(openCR)                   # also loads secr
options(digits = 4, width = 90)   # for more readable output

## ----dipper, eval = TRUE, message = FALSE, warning = FALSE------------------------------
m.array(dipperCH, never.recap = T)   # compare Lebreton et al. 1992 Table 10

## ----dipperCJS, fig.width = 4.5, fig.height = 3.3---------------------------------------
dipper.phi.t <- openCR.fit(dipperCH, type = 'CJS', model = phi~t)
predict(dipper.phi.t)
plot(dipper.phi.t, par = 'phi', ylim = c(0,1), pch = 16, col = 'red')

## ----compare, cache = mycache, warning = FALSE------------------------------------------
msk <- make.mask(traps(captdata), buffer = 100, type = 'trapbuffer')

secr <- secr.fit(captdata, detectfn = 'HHN', mask = msk, trace = FALSE)
openCR <- openCR.fit(captdata, detectfn = 'HHN', mask = msk, type = 'secrD')

# massage the predict.openCR results to the same format as predict.secr
pred_openCR <- plyr::rbind.fill(predict(openCR))[c(2,1,3),-1]
rownames(pred_openCR) <- secr$realnames

# compare estimates
predict(secr)[,-1]
pred_openCR

## ----timing-----------------------------------------------------------------------------
# compare timings in seconds
c(secr = secr$proctime, openCR = openCR$proctime)

## ----multinom---------------------------------------------------------------------------
# compare maximised log likelihoods
c(secr.logLik = logLik(secr), openCR.logLik = logLik(openCR) + logmultinom(captdata))

## ----makedf, cache = mycache------------------------------------------------------------
makedf.b <- function (ch, spatial = FALSE, nmix = 1, naive = FALSE) {
    ch <- squeeze(ch)
    # Construct matrix of logical values TRUE iff caught before 
    detected <- apply(abs(ch),1:2,sum)>0
    detected <- t(apply(detected, 1, cumsum)>0)
    if (naive)
        b <- rep(FALSE, prod(dim(ch)[1:2]))
    else
        b <- t(apply(detected, 1, function(x) {x[which.max(x)] <- FALSE; x}))
    # For a simple non-spatial case: data.frame(customb = as.vector(b))  
    # More generally:
    n <- nrow(ch)
    S <- ncol(ch)
    K <- if (spatial) dim(ch)[3] else 1
    data.frame(customb = insertdim(b, 1:2, c(n,S,K,nmix)))  
}

## ----customb, cache = mycache, warning = FALSE------------------------------------------
ovenj <- join(ovenCH)
fitb <- openCR.fit(ovenj, model = p ~ b)
fitbc <- openCR.fit(ovenj, model = p ~ customb, dframe = makedf.b(ovenj))
AIC(fitb, fitbc)

## ----customb2, cache = mycache, warning = FALSE-----------------------------------------
fitb2 <- openCR.fit(ovenj, model = p ~ b, type = 'JSSAfCL', start = fitb)
fitbc2 <- openCR.fit(ovenj, model = p ~ customb,  type = 'JSSAfCL', 
                    dframe = makedf.b(ovenj), dframe0 = makedf.b(ovenj, naive = TRUE))
AIC(fitb2, fitbc2)

## ----transient, cache = mycache---------------------------------------------------------
makedf.resident <- function (ch, spatial = FALSE, nmix = 1) {
    ch <- squeeze(ch)
    n <- nrow(ch)
    S <- ncol(ch)
    K <- if (spatial) dim(ch)[3] else 1
    primary <- primarysessions(intervals(ch))
    detected <- apply(abs(ch),1:2,sum)>0
    nprimary <- apply(detected, 1, function(x) length(unique(primary[x])))
    data.frame(resident = insertdim(nprimary>1, 1, c(n,S,K,nmix)))  
}

## ----transient2, cache = mycache--------------------------------------------------------
addresidentcov <- function (ch) {
    primary <- primarysessions(intervals(ch))
    detected <- apply(abs(ch), 1:2, sum)>0
    nprimary <- apply(detected, 1, function(x) length(unique(primary[x])))
    covariates(ch) <- data.frame(residentcov =  nprimary>1)
    ch
}

## ----transient3, cache = mycache--------------------------------------------------------
ovenj <- join(ovenCH)
ovenj <- addresidentcov(ovenj)
fitnull <- openCR.fit(ovenj, model = phi ~ 1)
fitcov  <- openCR.fit(ovenj, model = phi ~ residentcov)
fitdf   <- openCR.fit(ovenj, model = phi ~ resident, dframe = makedf.resident(ovenj))
fits <- openCRlist(fitnull, fitcov, fitdf)
AIC(fits)
pred <- predict(fits, newdata = data.frame(resident = TRUE, residentcov = TRUE))
do.call(rbind, lapply(pred, '[[', 'phi'))

## ----transient4, eval = FALSE-----------------------------------------------------------
#  addresidentcov2 <- function (ch, d = 1) {
#      primary <- primarysessions(intervals(ch))
#      secondary <- secondarysessions(intervals(ch))
#      detected <- apply(abs(ch), 1:2, sum)>0
#      nprimary <- apply(detected, 1, function(x) length(unique(primary[x])))
#      dsecondary <- apply(detected, 1, function(x)
#          max(by(secondary[x], primary[x], function(y) diff(range(y)))))
#      covariates(ch) <- data.frame(residentcov1 = nprimary>1,
#                                   residentcov2 = nprimary>1 | dsecondary>=d)
#      ch
#  }

## ----dummy, eval = TRUE, cache = mycache------------------------------------------------
fit0 <- openCR.fit(ovenCH, model = p~t)
contr.none <- function(n) contrasts(factor(1:n), contrasts = FALSE)
fitd <- openCR.fit(ovenCH, model = p ~ -1+t, 
                   details = list(contrasts = list(t = contr.none)))
coef(fit0)
coef(fitd)

## ----contrsum, eval = TRUE, cache = mycache---------------------------------------------
fit <- openCR.fit(dipperCH, model = phi~t, details = list(contrasts = list(t = contr.sum)))
invlogit(coef(fit)['phi',c('beta','lcl','ucl')])

## ----plotkernel, fig.width=5, fig.height=3.5--------------------------------------------
par (mar=c(2,2,3,6), cex=0.9)
plotKernel ('normal', spacing = 10, pars = 40, clip = TRUE, contour = TRUE)

## ----derived, cache = mycache-----------------------------------------------------------
dipperCL <- openCR.fit(dipperCH, type = 'JSSAlCL', 
            model = list(lambda~t, phi~t))
# only these parameters are in the model and estimated directly,
names(predict(dipperCL))
# but we can derive b, f, gamma and N, as well as the super-population N
d <- derived(dipperCL)
print(d, digits = 3, legend = TRUE)

## ----fitnm, cache = mycache-------------------------------------------------------------
fitnr <- openCR.fit(ovenCH, type = 'JSSAlCL', model = list(phi ~ t, lambda~t))
fitnm <- openCR.fit(ovenCH, type = 'JSSAlCL', model = list(phi ~ t, lambda~t),
                    method = "Nelder-Mead", details = list(control = list(maxit = 5000)))

## ----aic, cache = mycache---------------------------------------------------------------
AIC(fitnm,fitnr)

## ----fitnm2, cache = mycache------------------------------------------------------------
fitnm <- openCR.fit(ovenCH, type = 'JSSAlCL', model = list(phi ~ t, lambda~t),
                    method = "Nelder-Mead", details = list(control = list(maxit = 2000)),
                    start = fitnr)
AIC(fitnm,fitnr)

## ----ucare------------------------------------------------------------------------------
if (requireNamespace("R2ucare"))
    ucare.cjs(dipperCH, verbose = FALSE, by = 'sex')

