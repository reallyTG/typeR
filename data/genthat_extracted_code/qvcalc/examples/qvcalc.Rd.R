library(qvcalc)


### Name: qvcalc
### Title: Quasi Variances for Model Coefficients
### Aliases: qvcalc qvcalc.default qvcalc.lm qvcalc.itempar summary.qv
###   print.qv
### Keywords: models regression

### ** Examples

##  Overdispersed Poisson loglinear model for ship damage data
##  from McCullagh and Nelder (1989), Sec 6.3.2 
if (require(MASS)) {
    data(ships)
    ships$year <- as.factor(ships$year)
    ships$period <- as.factor(ships$period)
    shipmodel <- glm(formula = incidents ~ type + year + period,
                     family = quasipoisson, 
                     data = ships,
                     subset = (service > 0),
                     offset = log(service))
    shiptype.qvs <- qvcalc(shipmodel, "type")
    summary(shiptype.qvs, digits = 4)
    plot(shiptype.qvs, xlab = "ship type")
## An equivalent result by using the coef.indices argument instead:
    shiptype.qv2 <- qvcalc(shipmodel, coef.indices = c(0, 2:5))
}

## Based on an example from ?itempar
if(require(psychotools)) {
    data("VerbalAggression", package = "psychotools")
    raschmod <- raschmodel(VerbalAggression$resp2)
    ip1 <- itempar(raschmod)
    qv1 <- qvcalc(ip1)
    summary(qv1) }

##  Example of a negative quasi variance
##  Requires the "car" package
## Not run: 
##D     library(car)
##D     data(Prestige)
##D     attach(Prestige)
##D     mymodel <- lm(prestige ~ type + education)
##D     library(qvcalc)
##D     type.qvs <- qvcalc(mymodel, "type")
##D     ##  Warning message: 
##D     ##  In sqrt(qv) : NaNs produced
##D     summary(type.qvs)
##D     ##  Model call:  lm(formula = prestige ~ type + education) 
##D     ##  Factor name:  type 
##D     ##          estimate       SE  quasiSE  quasiVar
##D     ##    bc    0.000000 0.000000 2.874361  8.261952
##D     ##    prof  6.142444 4.258961 3.142737  9.876793
##D     ##    wc   -5.458495 2.690667      NaN -1.022262
##D     ##  Worst relative errors in SEs of simple contrasts (%):  0 0 
##D     ##  Worst relative errors over *all* contrasts (%):  0 0
##D     plot(type.qvs)
##D     ##  Error in plot.qv(type.qvs) :  No comparison intervals available,
##D     ##  since one of the quasi variances is negative.  See ?qvcalc for more.
## End(Not run) 



