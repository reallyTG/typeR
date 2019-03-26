library(VGAMextra)


### Name: ECM.EngleGran
### Title: VGLTSM family function for the Two-dimensional Error-Correction
###   Model (Engle and Granger, 1987) for I(1)-variables
### Aliases: ECM.EngleGran

### ** Examples


## Example 1. Comparing the Engle -- Granger procedure carried oud by two procedures.
##            ECM.EngleGran() makes easier the fitting process.
## Here, we will use:
## A) The R code 4.2, in Chapter 4, Pfaff (2011).
##    This code 1) generates artificial data and 2) fits an ECM, following
##    the Engle --Granger procedure. 
## B) The ECM.EngleGran() family function to fit the same model assuming
##    bivariate normal innovations. 
## The downside in the R code 4.2 is the assumption of no--correlation among
## the errors. These are generated indenpendently.
## A)
## STEP 1. Set up the data (R code as in Pfaff (2011)).
nn <- 100
set.seed(123456)
e1 <- rnorm(nn)   # Independent of e2
e2 <- rnorm(nn)
y1 <-  cumsum(e1)
y2 <- 0.6 * y1 + e2
lr.reg <- lm(y2 ~ y1)
error <- residuals(lr.reg)
error.lagged <- error[-c(nn - 1, nn)]
dy1 <- diff(y1)
dy2 <- diff(y2)
diff.dat <- data.frame(embed(cbind(dy1, dy2), 2))
colnames(diff.dat) <- c('dy1', 'dy2', 'dy1.1', 'dy2.1')

##  STEP 2. Fit the ECM model, using lm(), R code as in Pfaff (2011).
ecm.reg <- lm(dy2 ~ error.lagged + dy1.1 + dy2.1, data = diff.dat)

summary(ecm.reg)


## B) Now, using ECM.EngleGran() and VGLMs, the steps at A) can be skipped. 
## Enter the I(1)--variables in the response vector only, putting down the
## the dependent variable from the I(1) set, i.e. y2, in the second column.

coint.data <- data.frame(y1 = y1, y2 = y2)
fit.ECM <- vglm(cbind(y1, y2) ~ 1, ECM.EngleGran, data = coint.data, trace = TRUE)

## Check coefficients ##
coef(fit.ECM, matrix = TRUE)  ## Compare 'Diff2' with summary(ecm.reg)
coef(summary(ecm.reg))

head(depvar(fit.ECM))   # The estimated differences (first order)
vcov(fit.ECM)
constraints(fit.ECM, matrix = TRUE)

## Not run: 
##D ### Example 2.  Here, we compare ECM.EngleGran() from VGAMextra with VECM() from
##D ##              package "tsDyn" when fitting an ECM(1, 1). We will make use of
##D ##              the argument 'ordtsDyn' so that the outcomes can be compared.
##D 
##D library("tsDyn")  # Need to be installed first.
##D fit.tsDyn1 <- with(coint.data, VECM(cbind(y2, y1), lag = 1, estim = "2OLS")) #  MODEL 1
##D summary(fit.tsDyn1)
##D 
##D ### Fit same model using ECM.EngleGran(). NOTE: Set ordtsDyn = 1 !!          #  MODEL 2
##D fit.ECM.2 <- vglm(cbind(y1, y2) ~ 1, ECM.EngleGran(ecm.order = c(1, 1),
##D                   resids.pattern = "neither", ordtsDyn = 1),
##D                   data = coint.data, trace = TRUE)
##D 
##D coef.ECM.2 <- coef(fit.ECM.2, matrix = TRUE)
##D fit.tsDyn1$coefficients                      ## From pakage 'tsDyn'.
##D t(coef.ECM.2[, 1:2][c(2, 1, 4, 3), ][, 2:1]) ## FROM VGAMextra 
##D 
##D 
##D ### Example 3. An ECM(2, 2), with residuals estimated by OLS, with NO intercept
##D ###            and NO trend term. The data set is 'zeroyld', from package tsDyn.
##D ###            ECM.EngleGran() and with VECM() willbe compared again.
##D data(zeroyld, package = "tsDyn")
##D 
##D # Fit a VECM with Engle-Granger 2OLS estimator:
##D vecm.eg <- VECM(zeroyld, lag=2, estim = "2OLS") 
##D summary(vecm.eg)
##D 
##D # For the same data, fit a VECM with ECM.EngleGran(), from VGAMextra.
##D # Set ordtsDyn = 1 for compatibility! 
##D fit.ECM.3 <- vglm(cbind(long.run, short.run) ~ 1, ECM.EngleGran(ecm.order = c(2, 2),
##D                                   resids.pattern = "neither", ordtsDyn = 1),
##D                   data = zeroyld, trace = TRUE)
##D coef.ECM.3 <- coef(fit.ECM.3, matrix = TRUE)
##D 
##D #### Compare results
##D vecm.eg$coefficients                               # From tsDyn
##D t(coef.ECM.3[, 1:2][c(2, 1, 5, 3, 6, 4 ),][, 2:1]) # FROM VGAMextra
## End(Not run)



