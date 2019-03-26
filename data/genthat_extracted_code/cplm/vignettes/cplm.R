### R code from vignette source 'cplm.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: options
###################################################
options(prompt = "R> ", digits = 4, show.signif.stars = FALSE)


###################################################
### code chunk number 2: cplm.Rnw:48-70
###################################################
mypar <- function(){
  parold <- par(mar = c(3.5, 2.5, 2, 0.5), tck = -0.02, 
    mgp = c(1.3, 0.2, 0), cex.axis = 0.7, cex.lab = 0.7)
  parold
}

# no margin in lattice
theme.novpadding <-
   list(layout.heights =
        list(top.padding = 0,
       main.key.padding = 0,
 	    key.axis.padding = 0,
 	    axis.xlab.padding = 0,
 	    xlab.key.padding = 0,
 	    key.sub.padding = 0,
 	    bottom.padding = 0),
        layout.widths =
        list(left.padding = 0,
 	    key.ylab.padding = 0,
 	    ylab.axis.padding = 0,
 	    axis.key.padding = 0,
 	    right.padding = 1))


###################################################
### code chunk number 3: cplm.Rnw:117-122
###################################################
library(cplm)
obj <- new("cplm")  # create an object of class "cplm"
names(obj)          # or slotNames(obj)
obj$inits           # or obj@inits
obj[["inits"]]      # or slot(obj, "inits")


###################################################
### code chunk number 4: cplm.Rnw:126-127 (eval = FALSE)
###################################################
## showMethods(classes = "cpglm")


###################################################
### code chunk number 5: cplm.Rnw:130-133 (eval = FALSE)
###################################################
## class ? bcplm
## method ? resid("cpglm") # the "resid" method for class "cpglm" 
## method ? resid("cpglmm")


###################################################
### code chunk number 6: cplm.Rnw:176-179 (eval = FALSE)
###################################################
## da <- subset(AutoClaim, IN_YY == 1) # use data in the Yip and Yau paper
## da <- transform(da, CLM_AMT5 = CLM_AMT5/1000,
##                 INCOME = INCOME/10000)


###################################################
### code chunk number 7: cplm.Rnw:182-183 (eval = FALSE)
###################################################
## summary(da$CLM_AMT5); sum(da$CLM_AMT5 == 0)/nrow(da)


###################################################
### code chunk number 8: cplm.Rnw:192-194 (eval = FALSE)
###################################################
## P1 <- cpglm(CLM_AMT5 ~ CAR_USE + MARRIED + AREA + MVR_PTS, data = da)
## summary(P1)


###################################################
### code chunk number 9: cplm.Rnw:222-223 (eval = FALSE)
###################################################
## c(coef(P1), p = P1$p, phi = P1$phi)


###################################################
### code chunk number 10: cplm.Rnw:236-238 (eval = FALSE)
###################################################
## P1.big <- cpglm(CLM_AMT5 ~ CAR_USE + MARRIED + AREA + MVR_PTS, 
##     data = da, chunksize = 500)


###################################################
### code chunk number 11: cplm.Rnw:260-261
###################################################
head(FineRoot)


###################################################
### code chunk number 12: cplm.Rnw:265-266
###################################################
load("cpglmm.RData")


###################################################
### code chunk number 13: cplm.Rnw:268-270 (eval = FALSE)
###################################################
## f0 <- cpglmm(RLD ~ Stock * Zone +  (1|Plant), data = FineRoot)
## summary(f0)


###################################################
### code chunk number 14: cplm.Rnw:297-298
###################################################
inherits(f0, "mer")


###################################################
### code chunk number 15: cplm.Rnw:301-304
###################################################
fixef(f0)  #coefficients
ranef(f0)
VarCorr(f0)  #variance components


###################################################
### code chunk number 16: cplm.Rnw:308-310 (eval = FALSE)
###################################################
## FineRoot$Plant <- factor(FineRoot$Plant)
## f1 <- cpglmm(RLD ~ Stock + Spacing + (1|Plant), data = FineRoot)


###################################################
### code chunk number 17: cplm.Rnw:313-317 (eval = FALSE)
###################################################
## f2 <- update(f1, . ~ . + (1|Zone))
## f3 <- update(f1, . ~ . + (1|Plant:Zone))
## # test the additional random effect
## anova(f1, f2)


###################################################
### code chunk number 18: cplm.Rnw:330-331 (eval = FALSE)
###################################################
## anova(f1, f3)


###################################################
### code chunk number 19: cplm.Rnw:345-348 (eval = FALSE)
###################################################
## f4 <- cpglmm(RLD ~  Stock * Zone +  (1|Plant), 
##             data = FineRoot, optimizer = "L-BFGS-B", 
##             control = list(trace = 2, PQL.init = FALSE))


###################################################
### code chunk number 20: cplm.Rnw:368-370 (eval = FALSE)
###################################################
## f5 <- cpglmm(RLD ~  Stock * Zone +  (1|Plant), 
##             data = FineRoot, nAGQ = 10)


###################################################
### code chunk number 21: cplm.Rnw:378-379 (eval = FALSE)
###################################################
## P2 <- cpglmm(CLM_AMT5 ~ CAR_USE + MARRIED + AREA + tp(MVR_PTS), data = da)


###################################################
### code chunk number 22: cplm.Rnw:390-391 (eval = FALSE)
###################################################
## plotF(P2, rug = FALSE)


###################################################
### code chunk number 23: cplm.Rnw:430-434 (eval = FALSE)
###################################################
## set.seed(10)
## B1 <- bcplm(increLoss ~ factor(year) + factor(lag), data = ClaimTriangle, 
##             n.chains = 2, n.iter = 7000, tune.iter = 4000,
##             n.burnin = 2000, n.thin = 5, bound.p = c(1.1, 1.95))


###################################################
### code chunk number 24: cplm.Rnw:458-459 (eval = FALSE)
###################################################
## summary(gelman.diag(B1$sims.list)[[1]][, 1])


###################################################
### code chunk number 25: cplm.Rnw:466-468 (eval = FALSE)
###################################################
## xyplot(B1$sims.list[, c(1:2, 20, 21)], xlab = NULL)
## densityplot(B1$sims.list[, c(1:2, 20, 21)], ylab = NULL)


###################################################
### code chunk number 26: cplm.Rnw:499-503 (eval = FALSE)
###################################################
## set.seed(10)
## B2 <- bcplm(RLD ~ Stock * Zone + (1|Plant), 
##             data = FineRoot, n.iter = 11000, 
##             n.burnin = 1000, n.thin = 10)


###################################################
### code chunk number 27: cplm.Rnw:506-507 (eval = FALSE)
###################################################
## summary(B2)


###################################################
### code chunk number 28: cplm.Rnw:582-585 (eval = FALSE)
###################################################
## P3 <- zcpglm(CLM_AMT5 ~ CAR_USE + MARRIED + AREA + MVR_PTS||
##             MVR_PTS + INCOME, data = da)
## summary(P3)


###################################################
### code chunk number 29: cplm.Rnw:615-636 (eval = FALSE)
###################################################
## # p(y = 0) in cpglm
## da$prob0 <- exp(-fitted(P1)^(2 - P1$p)/(P1$phi * (2 - P1$p)))
## 
## # p(y = 0) in zcpglm
## q <- predict(P3, da, type = "zero")
## mut <- predict(P3, da, type = "tweedie")
## da$prob1 <- q + (1 - q) * exp(-mut^(2 - P3$p) / (P3$phi * (2- P3$p)))
## 
## # plot
## da$MVR_BIN <- Hmisc::cut2(da$MVR_PTS, g = 8, levels.mean = TRUE)
## tmp <- plyr::ddply(da, c("MVR_BIN"), summarize, 
##              freq0 = sum(CLM_AMT5 == 0)/length(CLM_AMT5),
##              prob0 = mean(prob0),
##              prob1 = mean(prob1))
## tmp$MVR_BIN <- as.numeric(as.character(tmp$MVR_BIN))
## with(tmp, {plot(MVR_BIN, freq0, cex = 0.5, mgp = c(1.3, 0.2, 0),
##                 ylab = "probability of zero")
##            lines(MVR_BIN, prob0, col = 2)
##            lines(MVR_BIN, prob1, col = 3)})
## legend("topright", c("OBS", "CPGLM", "ZCPGLM"), 
##         pch = c(1, NA, NA), lty = c(NA, 1, 1), col = 1:3)


###################################################
### code chunk number 30: cplm.Rnw:678-682 (eval = FALSE)
###################################################
## da <- transform(da, P1 = fitted(P1), P2 = fitted(P2), P3 = fitted(P3))
## gg <- gini(loss = "CLM_AMT5", score  = paste("P", 1:3, sep = ""), 
##            data = da)
## gg


###################################################
### code chunk number 31: cplm.Rnw:701-703 (eval = FALSE)
###################################################
## theme_set(theme_bw())
## plot(gg, overlay = FALSE)


