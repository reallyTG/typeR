library(lme4)


### Name: prt-utilities
### Title: Print and Summary Method Utilities for Mixed Effects
### Aliases: .prt.methTit .prt.VC .prt.aictab .prt.call .prt.family
###   .prt.grps .prt.methTit .prt.resids .prt.warn formatVC llikAIC
###   methTitle
### Keywords: utilities

### ** Examples

## Create a few "lme4 standard" models ------------------------------
fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
fmM <- update(fm1, REML=FALSE) # -> Maximum Likelihood

gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
             data = cbpp, family = binomial)
gmA <- update(gm1, nAGQ = 5)


(lA1 <- llikAIC(fm1))
(lAM <- llikAIC(fmM))
(lAg <- llikAIC(gmA))

(m1 <- methTitle(fm1 @ devcomp $ dims))
(mM <- methTitle(fmM @ devcomp $ dims))
(mG <- methTitle(gm1 @ devcomp $ dims))
(mA <- methTitle(gmA @ devcomp $ dims))

.prt.methTit(m1, class(fm1))
.prt.methTit(mA, class(gmA))

.prt.family(gaussian())
.prt.family(binomial())
.prt.family( poisson())

.prt.resids(residuals(fm1), digits = 4)
.prt.resids(residuals(fmM), digits = 2)

.prt.call(getCall(fm1))
.prt.call(getCall(gm1))

.prt.aictab ( lA1 $ AICtab ) # REML
.prt.aictab ( lAM $ AICtab ) # ML --> AIC, BIC, ...

V1 <- VarCorr(fm1)
m <- formatVC(V1)
stopifnot(is.matrix(m), is.character(m), ncol(m) == 4)
print(m, quote = FALSE) ## prints all but the first line of .prt.VC() below:
.prt.VC( V1, digits = 4, formatter = format)
## Random effects:
##  Groups   Name        Std.Dev. Corr
##  Subject  (Intercept) 24.740
##           Days         5.922   0.07
##  Residual             25.592

p1 <- capture.output(V1)
p2 <- capture.output( print(m, quote=FALSE) )
pX <- capture.output( .prt.VC(V1, digits = max(3, getOption("digits")-2)) )
stopifnot(identical(p1, p2),
          identical(p1, pX[-1])) # [-1] : dropping 1st line

.prt.grps(ngrps = ngrps(fm1),
          nobs  = nobs (fm1))
## --> Number of obs: 180, groups:  Subject, 18

.prt.warn(fm1 @ optinfo) # nothing .. had no warnings



