library(glogis)


### Name: breakpoints.glogisfit
### Title: Segmented Fitting of the Generalized Logistic Distribution
### Aliases: breakpoints.glogisfit coef.breakpoints.glogisfit
###   fitted.breakpoints.glogisfit refit.breakpoints.glogisfit
###   index.breakpoints.glogisfit confint.breakpoints.glogisfit
###   breakdates.confint.breakpoints.glogisfit
###   print.confint.breakpoints.glogisfit
###   lines.confint.breakpoints.glogisfit
### Keywords: regression

### ** Examples

## artifical data with one structural change
set.seed(1071)
x <- c(rglogis(50, -1, scale = 0.5, shape = 3), rglogis(50, 1, scale = 0.5, shape = 1))
x <- zoo(x, yearmon(seq(2000, by = 1/12, length = 100)))

## full sample estimation
gf <- glogisfit(x)

if(require("strucchange")) {

## structural change testing
gf_scus <- gefp(gf, fit = NULL)
plot(gf_scus, aggregate = FALSE)
plot(gf_scus, functional = meanL2BB)
sctest(gf_scus)
sctest(gf_scus, functional = meanL2BB)

## No test: 
## breakpoint estimation
gf_bp <- breakpoints(gf)
plot(gf_bp)
summary(gf_bp)
breakdates(gf_bp)
coef(gf_bp)
confint(gf_bp)

## fitted model
plot(x)
lines(gf_bp)
lines(fitted(gf_bp, type = "mean"), col = 4)
lines(confint(gf_bp))
## End(No test)
}



