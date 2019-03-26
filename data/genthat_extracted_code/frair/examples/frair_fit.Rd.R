library(frair)


### Name: frair_fit
### Title: Fit predator-prey functional responses.
### Aliases: frair_fit

### ** Examples

data(gammarus)

frair_responses() # See what is available
# A typeII fit
outII <- frair_fit(eaten~density, data=gammarus, response='rogersII', 
        start=list(a = 1.2, h = 0.015), fixed=list(T=40/24))

# A linear fit
outI <- frair_fit(eaten~density, data=gammarus, response='typeI', 
        start=list(a=0.5), fixed=list(T=40/24))

# Visualise fits
plot(outII, pch=20, col=rgb(0,0,0,0.2), xlim=c(0,30))
lines(outII)
lines(outI, lty=3)

# Have a look at original fits returned by mle2 (*highly* recommended)
summary(outII$fit)
summary(outI$fit)
# Compare models using AIC
AIC(outI$fit,outII$fit)

# Bythotrephes
data("bythotrephes")
# Fit several models and examine them using AIC. 
b_flex <- frair_fit(eaten~density, data=bythotrephes, 
                    response='flexpnr', 
                    start=list(b = 1.2, q = 0, h = 0.015), 
                    fixed=list(T=12/24))
b_II <- frair_fit(eaten~density, data=bythotrephes, 
                  response='flexpnr', 
                  start=list(b = 1.2, h = 0.015), 
                  fixed=list(T=12/24, q = 0))
b_rogersII <- frair_fit(eaten~density, data=bythotrephes, 
                  response='rogersII', 
                  start=list(a = 1.2, h = 0.015), 
                  fixed=list(T=12/24))
AIC(b_flex$fit, b_II$fit, b_rogersII$fit)
AICtab(b_flex$fit, b_II$fit, b_rogersII$fit)
# b_II and b_rogersII are identical, by definition when q = 0
# b_flex is strongly preferred (delta AIC = 16.9)

# The role of T
## Users need to be aware that changing T will change 
## the units of fitted coefficients.  
## For example, with the Gammarus dataset:
g_T1 <- frair_fit(formula = eaten~density, data = gammarus, 
                  response = "rogersII", 
                  start = list(a = 2, h = 0.1), fixed = list(T = 1))
g_Td <- frair_fit(formula = eaten~density, data = gammarus, 
                  response = "rogersII", 
                  start = list(a = 1, h = 0.1), fixed = list(T = 40/24))
g_Th <- frair_fit(formula = eaten~density, data = gammarus, 
                  response = "rogersII", 
                  start = list(a = 0.05, h = 4), fixed = list(T = 40))
diff_t <- round(rbind(coef(g_T1), coef(g_Td), coef(g_Th)), 2)
row.names(diff_t) <- c("g_T1 (Experimental Time)", "g_Td (Days)", "g_Th (Hours)")
print(diff_t)

## Not run: 
##D ## Fitting curves outside of FRAIR
##D # Many advanced users will not be satisfied with FRAIR current limitations.
##D # To fit models outside FRAIR, you could proceed as follows:
##D 
##D # Using mle2 or mle manually:
##D strt <- list(a = 1.2, h = 0.015)
##D fxd <- list(T=40/24)
##D dat <- list('X'=gammarus$density, 'Y'=gammarus$eaten)
##D manual_fit <- mle2(rogersII_nll, start=strt, fixed=fxd, 
##D                    method='SANN', data=dat)
##D # Note that the SANN method is *not* a general-purpose algorithm, 
##D # but it will return *something*, so might be helpful for finding starting values.
##D 
##D # Controlling iterations, optimisers, etc... See ?mle2 and ?optim
##D cntrl <- list(trace = 3, maxit = 1000)
##D manual_fit_2 <- mle2(rogersII_nll, start=strt, fixed=fxd, 
##D                      method='BFGS', data=dat, control=cntrl)
## End(Not run)



